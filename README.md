# Example Usage:

```lua
local Debounce = require(game.ReplicatedStorage.Modules.Debounce)

local coinPart = script.Parent
local giveCoinsDebounce = Debounce.new(3)

coinPart.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if not humanoid then return end

	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if not player then return end

	if giveCoinsDebounce:Check(player) then
		print(player.Name .. " touched the part. ")
	else
		print(giveCoinsDebounce:GetRemaining(player))
	end
end)
```
