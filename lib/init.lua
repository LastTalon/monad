local Monad = require(script.Monad)
local MonadTypes = require(script.types.MonadTypes)
local Unit = require(script.Unit)
local compose = require(script.compose)
local lift = require(script.lift)

export type AnyMonad = MonadTypes.AnyMonad
export type Monad<T> = MonadTypes.Monad<T>
export type Unit = Unit.Unit

return {
	Monad = Monad,
	Unit = Unit.Unit,
	isUnit = Unit.isUnit,
	compose = compose,
	lift = lift,
}
