local function isA<C, T>(class: C, object: T): boolean
	local current = object

	while current do
		if current == class then
			return true
		end

		local parent = getmetatable(current)
		current = parent and parent.__index
	end

	return false
end

return isA
