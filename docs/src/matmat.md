In the first example the summation operator ``\sum\limits_{j}`` disappeared because the summation index and the substitution index were the same. The summation is only non-zero when the summation index equals the substitution so the summation collapse to a single term. 

The next example shows a case where this is not true: given ``f_k = B_{ki}A_{ij}x_j`` compute ``\frac{\partial f_k}{\partial x_n}``.

First create the function graph corresponding to ``f_k = B_{ki}A_{ij}x_j`` ![BAx](illustrations/BAx/BAx_illustration.svg)

Now transform to a derivative graph and gray out edges and nodes which do not contribute to the derivative:
![BAx partial](illustrations/BAx/BAx_partial_xjD.svg)

Create the substitution rule by locating  by locating the variable node ``x_j``.

![BAx partial](illustrations/BAx/BAx_partial_xj_step1D.svg)

Apply the substitution rule up the graph

![BAx partial](illustrations/BAx/BAx_partial_xj_step2D.svg)
![BAx partial](illustrations/BAx/BAx_partial_xj_step3D.svg)


No terms higher in the graph than the ``\sum\limits_{j}`` node use the index ``j`` so none of them are affected by the substitution rule ``sub((j=n),...)``.  

![BAx partial](illustrations/BAx/BAx_partial_xj_step4D.svg)

The final result is

```math
\frac{\partial f_k}{\partial x_n} = Df_{kn}= \sum\limits_{i} B_{ki}A_{in}
```




