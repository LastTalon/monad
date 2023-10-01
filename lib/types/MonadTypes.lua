-- export type Monad<T> = {
-- 	wrap: <T>(value: T) -> Monad<T>,
-- 	is: <T>(object: T) -> boolean,

-- 	Then: <U>(f: (value: T) -> Monad<U>) -> Monad<U>,

-- 	Map: <U>(f: (value: T) -> U) -> Monad<U>,
-- 	Apply: <U>(fMonad: Monad<(value: T) -> U>) -> Monad<U>,
-- 	Flatten: <U>() -> Monad<U>,
-- }

export type AnyMonad = {
	-- These must be implemented by extending classes
	wrap: (value: any) -> AnyMonad,
	Then: (self: AnyMonad, f: (value: any) -> AnyMonad) -> AnyMonad,

	is: <T>(object: T) -> boolean,
	Map: <U>(self: AnyMonad, f: (value: any) -> U) -> AnyMonad,
	Apply: (self: AnyMonad, fMonad: AnyMonad) -> AnyMonad,
	Flatten: (self: AnyMonad) -> AnyMonad,
	Void: (self: AnyMonad) -> AnyMonad,
	ThenReturn: (self: AnyMonad, monad: AnyMonad) -> AnyMonad,
}

export type Monad<T> = {
	-- These must be implemented by extending classes
	wrap: (value: T) -> Monad<T>,
	Then: (self: Monad<T>, f: (value: T) -> AnyMonad) -> AnyMonad,

	is: <T>(object: T) -> boolean,
	Map: <U>(self: Monad<T>, f: (value: T) -> U) -> AnyMonad,
	Apply: (self: Monad<T>, fMonad: AnyMonad) -> AnyMonad,
	Flatten: (self: Monad<T>) -> AnyMonad,
	Void: (self: Monad<T>) -> AnyMonad,
	ThenReturn: (self: Monad<T>, monad: AnyMonad) -> AnyMonad,
}

export type AnyEmptyMonad = AnyMonad & {
	-- These must be implemented by extending classes
	wrap: (value: any) -> AnyEmptyMonad,
	Then: (self: AnyEmptyMonad, f: (value: any) -> AnyEmptyMonad) -> AnyEmptyMonad,

	is: <T>(object: T) -> boolean,
	Map: <U>(self: AnyEmptyMonad, f: (value: any) -> U) -> AnyEmptyMonad,
	Apply: (self: AnyEmptyMonad, fMonad: AnyEmptyMonad) -> AnyEmptyMonad,
	Flatten: (self: AnyEmptyMonad) -> AnyEmptyMonad,
	Void: (self: AnyEmptyMonad) -> AnyEmptyMonad,
	ThenReturn: (self: AnyEmptyMonad, monad: AnyEmptyMonad) -> AnyEmptyMonad,

	-- These must be implemented by extending classes
	empty: () -> AnyEmptyMonad,
	IsEmpty: (self: AnyEmptyMonad) -> boolean,

	guard: (condition: boolean) -> AnyEmptyMonad,
	Filter: (self: AnyEmptyMonad, predicate: (value: any) -> boolean) -> AnyEmptyMonad,
	Or: (self: AnyEmptyMonad, monad: AnyEmptyMonad) -> AnyEmptyMonad,
	OrElse: (self: AnyEmptyMonad, f: () -> AnyEmptyMonad) -> AnyEmptyMonad,
}

export type EmptyMonad<T> = Monad<T> & {
	-- These must be implemented by extending classes
	wrap: (value: T) -> EmptyMonad<T>,
	Then: (self: EmptyMonad<T>, f: (value: T) -> AnyEmptyMonad) -> AnyEmptyMonad,

	is: <T>(object: T) -> boolean,
	Map: <U>(self: EmptyMonad<T>, f: (value: T) -> U) -> AnyEmptyMonad,
	Apply: (self: EmptyMonad<T>, fMonad: AnyEmptyMonad) -> AnyEmptyMonad,
	Flatten: (self: EmptyMonad<T>) -> AnyEmptyMonad,
	Void: (self: EmptyMonad<T>) -> AnyEmptyMonad,
	ThenReturn: (self: EmptyMonad<T>, monad: AnyEmptyMonad) -> AnyEmptyMonad,

	-- These must be implemented by extending classes
	empty: () -> EmptyMonad<T>,
	IsEmpty: (self: EmptyMonad<T>) -> boolean,

	guard: (condition: boolean) -> AnyEmptyMonad,
	Filter: (self: EmptyMonad<T>, predicate: (value: T) -> boolean) -> EmptyMonad<T>,
	Or: (self: EmptyMonad<T>, monad: EmptyMonad<T>) -> EmptyMonad<T>,
	OrElse: (self: EmptyMonad<T>, f: () -> EmptyMonad<T>) -> EmptyMonad<T>,
}

return nil
