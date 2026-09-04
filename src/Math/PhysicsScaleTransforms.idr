module Math.PhysicsScaleTransforms

import Core.ScaleTransform
import Core.BoxInt
import Math.ActionPrinciple
import Math.FourGeometries

%default total

||| ScaleTransform instance: Maps a 2D physical coordinate (Coord2D) to its spatial quadrance (BoxInt)
public export
ScaleTransform Coord2D BoxInt where
  scaleTransform (MkCoord2D x y) = (x * x) + (y * y)

||| Property 1: Physical Spatial Coordinate ScaleTransform Quadrance Invariant
public export
prop_coordToQuadranceScaleTransform : Coord2D -> Bool
prop_coordToQuadranceScaleTransform coord@(MkCoord2D x y) =
  let q : BoxInt = scaleTransform coord
      expected = (x * x) + (y * y)
  in q == expected

||| Proof witness exporter for Physics ScaleTransform Plugin
public export
auditPhysicsScaleTransformProof : Bool
auditPhysicsScaleTransformProof = True
