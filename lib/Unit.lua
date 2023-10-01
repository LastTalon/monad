local Package = script.Parent
local symbol = require(Package.symbol)

local Unit = symbol("Unit")

export type Unit = typeof(Unit)

local function isUnit<T>(value: T): boolean
	return value == Unit
end

return {
	Unit = Unit,
	isUnit = isUnit,
}
