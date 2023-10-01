local Package = script.Parent
local MonadTypes = require(Package.types.MonadTypes)
local Unit = require(Package.Unit)
local isA = require(Package.isA)

--[=[
	@class Monad
]=]
local Monad = setmetatable({}, {
	__tostring = function()
		return "Monad"
	end,
})
Monad.__index = Monad

function Monad.is<T>(object: T): boolean
	return isA(Monad, object)
end

--[=[
	@ignore
]=]
function Monad.constructor() end

function Monad:Map<T, U>(f: (value: T) -> U): MonadTypes.Monad<U>
	return self:Then(function(value: T): MonadTypes.Monad<U>
		return self.wrap(f(value))
	end)
end

function Monad:Apply<T, U>(fMonad: MonadTypes.Monad<(value: T) -> U>): MonadTypes.Monad<U>
	return fMonad:Then(function(f: (value: T) -> U): MonadTypes.Monad<U>
		return self:Map(f)
	end)
end

function Monad:Flatten<U>(): MonadTypes.Monad<U>
	return self:Then(function(innerMonad: MonadTypes.Monad<U>): MonadTypes.Monad<U>
		return innerMonad
	end)
end

function Monad:Void(): MonadTypes.Monad<Unit.Unit>
	return self:Map(function()
		return Unit.Unit
	end)
end

function Monad:ThenReturn<U>(monad: MonadTypes.Monad<U>): MonadTypes.Monad<U>
	return self:Then(function()
		return monad
	end)
end

return Monad
