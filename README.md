# TaskMagnet
## Introduction
TaskMagnet is a free open source library for roblox studio. 
The library is called "TaskMagnet" like a magnet would be stick to the player with tasks & connections in it.
And, this means that if the player leaves the game, every tasks related to him will be stopped.

## Why is this useful ? ?
Sometimes, when coding a game it, it may happen that you want to create tasks related to the player's presence. For example, let's say we want to make a BillboardGui above the player's head that displays a cooldown of 10 seconds.

So, we'll make a for loop, and we'll have to check if the player is still here to execute at every iteration which is not very clean and may cause problems.

## Vocabulary

To makes things easier, we'll define a few words before getting into the documentation :

- **magnet task : a task related to the player's presence in game** *(which means that if the player leaves the task will be canceled)*
- **magnet connection : a connection related to the player's presence in game**

## Documentation :

To attribute a magnet task : 

```TaskMagnet:AttributeTask(player, taskName, function)```

To stop a magnet task : 

```TaskMagnet:CancelTask(player, taskName)```

To attribute a magnet connection :

```TaskMagnet:AttributeConnection(player, connName, conn)```

To cancel a magnet connection : 

```TaskMagnet:CancelConnection(player, connName)```

## Download

To download the module, you can get it from the [Roblox's Creator Marketplace](https://create.roblox.com/marketplace/asset/14385810180/TaskMagnet) or get it from the github repo.

## Note

If you would like to do any PR, please add a .md file that explains the changes.
I hope this module is gonna be helpful to some of you reading this, and it is the first one I publish so everything may not be perfect but I tried by best to makes things as clear as possible. If you have any feedback/suggestion tell me.
