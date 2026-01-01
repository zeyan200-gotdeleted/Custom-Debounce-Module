local Debounce = {}; Debounce.__index = Debounce

function Debounce.new(cooldown: number)
	assert(typeof(cooldown) == "number" and cooldown > 0, "Cooldown must be a positive number")

	return setmetatable({
		_cooldown = cooldown,
		_lastCall = {},
	}, Debounce)
end

function Debounce:Check(key: any): boolean
	local currentTime = os.clock()
	local lastTime = self._lastCall[key]

	if not lastTime or (currentTime - lastTime >= self._cooldown) then
		self._lastCall[key] = currentTime
		return true
	else
		return false
	end
end

function Debounce:Reset(key: any)
	self._lastCall[key] = nil
end

function Debounce:Clear()
	self._lastCall = {}
end

function Debounce:GetRemaining(key: any): number
	local lastTime = self._lastCall[key]
	if not lastTime then
		return 0
	end
	local remaining = self._cooldown - (os.clock() - lastTime)
	return math.max(0, remaining)
end

return Debounce
