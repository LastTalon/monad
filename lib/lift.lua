local Package = script.Parent
local MonadTypes = require(Package.types.MonadTypes)

local function lift<T, U>(f: (value: T) -> U): (monad: MonadTypes.Monad<T>) -> MonadTypes.Monad<U>
	return function(monad: MonadTypes.Monad<T>): MonadTypes.Monad<U>
		return monad:Map(f)
	end
end

return lift
