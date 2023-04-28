# NTManager-RBX-
A Nametag Manager tool created aiming to be simple, easy but powerful.

----
# Basic Usage
```lua
--//NametagManager
local NametagManager = require(game.ReplicatedStorage.NametagManager)

--//Usage
game.Players.PlayerAdded:Connect(function(player)
  NametagManager.SetUp(player) -- Basic Usage
  NametagManager.SetUp(player, true) -- Basic Usage (w/ Display Name)
  NametagManager.SetUp(player, false, 15110989) -- Basic Usage (w/ Group Rank title)
end)
```

# General Advice
Check the ModuleScript (.rbxm file on this page) and edit it as you please.
