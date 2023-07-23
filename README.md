# The Derivative Graph and its use

The derivative graph is a data structure that represents the derivative of a function as a graph. Automatic differentiation algorithms are easier to understand when seen through the lens of the derivative graph. It is also an excellent framework for understanding and creating more general and efficient algorithms beyond forward and reverse. The derivative graph is a powerful new tool which gives the developer greater flexibility when designing general purpose AD systems.

In the remainder of this document you will learn 
* how the derivative graph is easily derived from the chain rule of Calculus.
* how forward and reverse are both implicit factorization algorithms operating on the derivative graph. The two algorithms share fundamental similarities that are more easily seen in the derivative graph description. 
* how algorithms for computing Jv, vᵀJ, and Hv, are structurally identical; they all reduce to simple edge insertion in the derivative graph. 
* how to make the *implicit* factorization of forward and reverse *explicit*. This will result in an AD algorithm that subsumes both and computes efficient derivatives for any R^n->R^m; forward and reverse are only close to optimal for R^1->R^n and R^n->R^1 functions respectively.
