module Math.LawFunctor

import Core.BoxInt
import Core.ScaleTransform
import Math.ActionPrinciple
import Math.FourGeometries

%default total

||| A Physical Law as a category-theoretic Scale Functor between physical state domains.
||| Unifies Idris 2's native Functor interface with Core.ScaleTransform.
public export
interface (Functor stateCarrier, ScaleTransform (stateCarrier a) (stateCarrier b)) => LawFunctor (lawIndex : Nat) stateCarrier a b where
  ||| Computes the forward physical pushforward map (Law application over state carrier)
  lawPushforward : (a -> b) -> stateCarrier a -> stateCarrier b
  lawPushforward f container = map f container

  ||| Computes the inverse physical pull-back map (Galois reconstruction)
  lawPullback : (b -> a) -> stateCarrier b -> stateCarrier a
  lawPullback g container = map g container

  ||| Computes the discrete entropy change ΔS across the law application
  lawEntropyDelta : stateCarrier a -> BoxInt

||| Category-theoretic Functor Identity Property: map id x == x
public export
prop_functorIdentity : (Eq (f a), Functor f) => f a -> Bool
prop_functorIdentity container = map id container == container

||| Category-theoretic Functor Composition Property: map (g . f) x == map g (map f x)
public export
prop_functorComposition : (Eq (f c), Functor f) => (b -> c) -> (a -> b) -> f a -> Bool
prop_functorComposition g f container = map (g . f) container == map g (map f container)

||| Composition of two LawFunctors: Law_AC = Law_BC . Law_AB
public export
composeLawFunctors : Functor f => (a -> b) -> (b -> c) -> f a -> f c
composeLawFunctors f g container = map g (map f container)
