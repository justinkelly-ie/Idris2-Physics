# Idris2-Physics

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Layer 3b Constructive Physical Laws & Conservation Theorems for Idris 2**

`Idris2-Physics` implements 44 fundamental constructive physical laws without continuous limits, floating-point numbers, or magic constants.

## 🚀 Key Physical Law Modules

- **`Math.ActionPrinciple`**: Discrete Euler-Lagrange equations $g \cdot \Delta^2 x + \nabla V(x_k) = (0, 0)$ and Geodesic Least Action Optimality verified via `%macro` reflection proof tactics.
- **`Math.ExclusionPrinciple`**: Fermionic Pauli exclusion and multiset spin anti-symmetry.
- **`Math.HelmholtzFreeEnergy`**: Discrete Helmholtz Free Energy $F = U - TS$ reaching its global minimum $F = -1320$ at the Primorial 210 ground state.
- **`Math.HolographicBound`**: 3D spatial regions of dimension $L=3$ bounded by 2D surface area $\text{Area}(\partial V) = 54$, enclosing the 210 cosmic budget ($4 \times 54 = 216 \ge 210$).
- **`Math.FractionalQuantumHall`**: Quasiparticle fractional charge $e^* = (p/q)e$ and anyonic exchange angle $\theta = \pi/q$ on exact `UnixelFraction` coordinates.

## 🚀 Building & Installing

```bash
idris2 --build Idris2-Physics.ipkg
idris2 --install Idris2-Physics.ipkg
```
