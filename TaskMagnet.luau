local TaskMagnet = {}

TaskMagnet.CurrentTasks = {}
TaskMagnet.CurrentConnections = {}

local Players = game:GetService("Players")

function GetIndexAmout(tbl)
	
	local Amount = 0
	
	for _, _ in pairs(tbl) do
		Amount += 1
	end
	
	return Amount
	
end

function TaskMagnet:AttributeTask(player : Player, taskName : string, tFunction)
	
	local CurrentPlayerTasks = self.CurrentTasks[player.Name]
	
	if CurrentPlayerTasks == nil then
		
		self.CurrentTasks[player.Name] = {}
		
		self.CurrentTasks[player.Name][taskName] = task.spawn(tFunction)
		
	else
		
		self.CurrentTasks[player.Name][taskName] = task.spawn(tFunction)
		
	end
	
end

function TaskMagnet:CancelTask(player : Player, taskName : string)
	
	local PlayerTasks = self.CurrentTasks[player.Name]
	
	if self.CurrentTasks[player.Name] ~= nil and self.CurrentTasks[player.Name][taskName] ~= nil then
		
		task.cancel(self.CurrentTasks[player.Name][taskName])
		
		self.CurrentTasks[player.Name][taskName] = nil

		if GetIndexAmout(self.CurrentTasks[player.Name]) == 0 then
			self.CurrentTasks[player.Name] = nil
		end
		
	end
	
end

function TaskMagnet:AttributeConnection(player : Player, connName : string, conn : RBXScriptConnection)

	local CurrentPlayerTasks = self.CurrentConnections[player.Name]

	if CurrentPlayerTasks == nil then

		self.CurrentConnections[player.Name] = {}

		self.CurrentConnections[player.Name][connName] = conn

	else

		self.CurrentConnections[player.Name][connName] = conn

	end

end

function TaskMagnet:CancelConnection(player : Player, connName : string)

	local PlayerTasks = self.CurrentConnections[player.Name]

	if self.CurrentConnections[player.Name] ~= nil and self.CurrentConnections[player.Name][connName] ~= nil then

		self.CurrentConnections[player.Name][connName]:Disconnect()

		self.CurrentConnections[player.Name][connName] = nil

		if GetIndexAmout(self.CurrentConnections[player.Name]) == 0 then
			self.CurrentConnections[player.Name] = nil
		end

	end

end

Players.PlayerRemoving:Connect(function(player)
	
	local PlayerTasks = TaskMagnet.CurrentTasks[player.Name]
	
	if PlayerTasks ~= nil then
		for taskName, _ in pairs(PlayerTasks) do
			TaskMagnet:CancelTask(player, taskName)
		end
	end
	
	local PlayerConnections = TaskMagnet.CurrentConnections[player.Name]

	if PlayerConnections ~= nil then
		for connName, _ in pairs(PlayerConnections) do
			TaskMagnet:CancelConnection(player, connName)
		end
	end
	
end)

return TaskMagnet
