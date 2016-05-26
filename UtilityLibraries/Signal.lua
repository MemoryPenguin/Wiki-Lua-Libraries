local Signal = {}
Signal.__index = Signal

function Signal.new()
	local self = setmetatable({}, Signal)
	self.Object = Instance.new("BindableEvent")
	
	return self
end

function Signal:Fire(...)
	self.Args = {...}
	self.Object:Fire()
end

function Signal:Connect(listener)
	return self.Object.Event:connect(function()
		listener(unpack(self.Args))
	end)
end
Signal.connect = Signal.Connect

function Signal:Wait()
	self.Object.Event:wait()
	return unpack(self.Args)
end
Signal.wait = Signal.Wait

return Signal