local Package = script.Parent
local Monad = require(Package.Monad)
local MonadTypes = require(Package.types.MonadTypes)
local Unit = require(Package.Unit)
local isA = require(Package.isA)

--[=[
	@class EmptyMonad
]=]
local EmptyMonad = setmetatable({}, {
	__tostring = function()
		return "EmptyMonad"
	end,
	__index = Monad,
})
EmptyMonad.__index = EmptyMonad

function EmptyMonad.is<T>(object: T): boolean
	return isA(EmptyMonad, object)
end

function EmptyMonad.guard(condition: boolean): MonadTypes.EmptyMonad<Unit.Unit>
	if condition then
		return EmptyMonad.wrap(Unit.Unit)
	end
	return EmptyMonad.empty()
end

function EmptyMonad:Filter<T>(predicate: (value: T) -> boolean): MonadTypes.EmptyMonad<T>
	return self:Then(function(value: T): MonadTypes.EmptyMonad<T>
		if predicate(value) then
			return self
		end
		return self.empty()
	end)
end

function EmptyMonad:Or<T>(monad: MonadTypes.EmptyMonad<T>): MonadTypes.EmptyMonad<T>
	if self:IsEmpty() then
		return monad
	end
	return self
end

function EmptyMonad:OrElse<T>(f: () -> MonadTypes.EmptyMonad<T>): MonadTypes.EmptyMonad<T>
	if self:IsEmpty() then
		return f()
	end
	return self
end
