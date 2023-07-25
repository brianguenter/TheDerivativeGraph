# The Derivative Graph and its use

The derivative graph is a data structure that represents the derivative of a function as a graph. It is both a fundamental data structure for implementing efficient automatic differentiation (AD) algorithms and a more perspicuous way of analyzing and understanding these algorithms. The derivative graph is a powerful new tool which gives the developer great flexibility when designing new general purpose AD systems.

In the remainder of this document you will learn 
* how the derivative graph is derived from the chain rule of Calculus.
* how to design efficient AD algorithms using a few simple heuristics.
* how forward and reverse are both implicit factorization algorithms operating on the derivative graph. The two algorithms share fundamental similarities that are more easily seen in the derivative graph description. 
* how to make the *implicit* factorization of forward and reverse *explicit*. This will result in an AD algorithm that subsumes both forward and reverse and computes efficient derivatives for any R^n->R^m; forward and reverse are only close to optimal for R^1->R^n and R^n->R^1 functions respectively.
* how algorithms for computing Jv, vᵀJ, and Hv, are structurally identical; they all reduce to simple edge insertion in the derivative graph. 

## The Chain Rule 

## Creating an AD algorithm from scratch
###  Rⁿ->R¹
###  R¹->Rⁿ
## Forward and Reverse
### Implicit Factorization
### TimeUsed

## Explicit Factorization and the D* algorithm

## Jv, vᵀJ, and Hv


