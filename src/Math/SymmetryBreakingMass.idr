module Math.SymmetryBreakingMass

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction

%default total

||| Represents a Discrete Higgs Field Vacuum state (v^2, λ, g).
public export
record DiscreteHiggsVacuum where
  constructor MkDiscreteHiggsVacuum
  vevSquared : UnixelFraction  -- v^2 (vacuum expectation value squared)
  lambda     : UnixelFraction  -- λ (self-coupling constant)
  gaugeCoeff : UnixelFraction  -- g (weak gauge coupling constant)

||| Computes the Discrete Higgs Potential V(φ) = λ * (φ^2 - v^2/2)^2.
public export
%inline
discreteHiggsPotential : DiscreteHiggsVacuum -> UnixelFraction -> UnixelFraction
discreteHiggsPotential (MkDiscreteHiggsVacuum vevSq lam _) phiSq =
  let halfVev = mulUnixelFraction (mkUnixelFraction (intToBoxInt 1) 2) vevSq
      diff = subUnixelFraction phiSq halfVev
  in mulUnixelFraction lam (mulUnixelFraction diff diff)

||| Verifies that spontaneous symmetry breaking ground state expectation value φ^2 = v^2/2
||| achieves the absolute minimum discrete potential V(φ) = 0.
public export
%inline
auditHiggsVacuumStabilityProof : Bool
auditHiggsVacuumStabilityProof =
  let vac = MkDiscreteHiggsVacuum (mkUnixelFraction (intToBoxInt 246) 1) (mkUnixelFraction (intToBoxInt 1) 8) (mkUnixelFraction (intToBoxInt 2) 3)
      phiGround = mkUnixelFraction (intToBoxInt 123) 1
      vMin = discreteHiggsPotential vac phiGround
  in (unwrapBox (num vMin) == 0)

||| Computes the exact rational gauge boson mass squared m_W^2 = (1/4) * g^2 * v^2.
public export
wBosonMassSquared : DiscreteHiggsVacuum -> UnixelFraction
wBosonMassSquared (MkDiscreteHiggsVacuum vevSq _ g) =
  let quarter = mkUnixelFraction (intToBoxInt 1) 4
      gSq = mulUnixelFraction g g
  in mulUnixelFraction quarter (mulUnixelFraction gSq vevSq)
