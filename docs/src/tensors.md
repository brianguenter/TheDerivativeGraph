Computing tensor derivatives is conceptually simple, at least for tensor operations that can be represented as sequences of tensor contractions, e.g., ``Ab = \sum\limits_{j} A_{ij}b{j}``. From now on we'll use the notation ``A_{ij}b{j}`` to mean ``\sum\limits_{j} A_{ij}b{j}``

Differentiation proceeds in simple steps:

* Explicitly mark the indices on all tensor terms.
* Transform the tensor expression into a function graph.
* Transform the function graph into a derivative graph. Change tensor contractions into summation operation nodes.
* Find the variable being differentiated with respect to and compute index substitutions. 
* Propagate the index substitutions up the graph.

Let's do a simple example first, before going into the details of why this works. For this function ``f_j = A_{ij}b_j`` compute ``\frac{\partial f_j}{\partial b_n}``. First, create the function graph corresponding to the expression.

![Ab](illustrations/Ab/Ab_illustration.svg)

Then transform this into a derivative graph

![Ab_deriv](illustrations/Ab/Ab_illustrationD.svg)

The variable being differentiated wrt is ``b_n``. Create the substitution ``sub(j=>n)`` and apply it to the graph nodes and edges on the product path from ``f_j`` to ``b_j``, beginning with ``b_j`` and working upward:



∂sum(j,Aᵢⱼ*bⱼ)/∂bₖ =sum(j,∂(Aᵢⱼ*bⱼ/∂bₖ))
    = sum(j, ∂(Aᵢⱼ*/∂bₖ))*bⱼ + Aᵢⱼ*∂bⱼ/∂bₖ

    ∂bⱼ/∂bₖ = except when j=k when it equals 1. 
    Create expression substitute(j=>k,Aᵢⱼ)
    this gives:
    = sum(j, 0*bⱼ + substitute(j=>k,Aᵢⱼ))
    = substitute(j=>k, sum(j, Aᵢₖ))
    propagate the substitution expression up through the sum
    sum(j=k, Aᵢₖ)
    ∂sum(j,Aᵢⱼ*bⱼ)/∂bₖ = Aᵢₖ


```math
\frac{\partial b_j}{\partial b_k} = \begin{cases}
0  & j \ne k, \\
1 & j=k
\end{cases}
```

Operations are scalar once they have been converted to index form. Product terms can be computed in any order (Example). This gives the AD algorithm designer great flexibility in deciding how to schedule operations on the processor.


In the first example the summation operator ``\sum\limits_{j}`` disappeared because the summation index and the substitution index were the same. The summation is only non-zero when the summation index equals the substitution so the summation collapse to a single term. 

The next example shows a case where this is not true. Given function ``f_k = B_{ki}A_{ij}x_j`` compute ``\frac{\partial f_k}{\partial x_n}``.

The illustrations show the differentiation starting from the original function graph on the left to the final derivative on the right. At each step the substitution operation ascends one level in the graph.

This is the function graph corresponding to ``f_k = B_{ki}A_{ij}x_j`` ![BAx](illustrations/BAx/BAx_illustration.svg)

The differentiation steps are shown in order from left to right. First the substitution variables are found by locating the variable node. In each succeeding step the substitution ascends one level in the graph.

![BAx partial](illustrations/BAx/BAx_partial_xj_step1D.svg)
![BAx partial](illustrations/BAx/BAx_partial_xj_step2D.svg)

 The final derivative is shown at the far right in the figure below.

![BAx partial](illustrations/BAx/BAx_partial_xj_step3D.svg)
![BAx partial](illustrations/BAx/BAx_partial_xj_step4D.svg)

In equation form
```math
\frac{\partial f_k}{\partial x_n} = \sum\limits_{i} B_{ki}A_{in}
```






