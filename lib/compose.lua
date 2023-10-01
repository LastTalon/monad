local Package = script.Parent
local MonadTypes = require(Package.types.MonadTypes)

function compose<T, U, V>(
	f: (value: U) -> MonadTypes.Monad<V>,
	g: (value: T) -> MonadTypes.Monad<U>
): (value: T) -> MonadTypes.Monad<V>
	return function(value: T): MonadTypes.Monad<V>
		return g(value):Then(f)
	end
end

return compose
