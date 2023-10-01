local function symbol(name: string)
	local symbolName = string.format("Symbol(%s)", name)

	return setmetatable({}, {
		__tostring = function()
			return symbolName
		end,
	})
end

return symbol
