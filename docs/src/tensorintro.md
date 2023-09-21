To compute tensor derivatives efficiently we will use a symbolic index representation. This has several benefits:
* Unlike other tensor differentiation systems which may apply many complex tensor identities to simplify an expression we will use a single simple operation: tensor contraction.
* In the symbolic index form all operations are scalar which gives the AD algorithm designer great flexibility to rearrange the order of operations. An important use of this feature is operator fusion. Another is tiling.
* Tensor differentiation tends to create tensors that are sparse. This sparsity is represented by constraint equations on the symbolic indices. Only element which satisfy the equations are non-zero which can greatly reduces storage and computation.

A tensor contraction is a summation along one or more indices. Using Einstein notation a contraction occurs whenever two terms have matching indices. For example, matrix-vector multiplication can be written as a tensor contraction
```math
\begin{aligned}
Ab &= \sum\limits_{j} A_{ij}b{j} \\
&= A_{ij}b_j
\end{aligned}
```

and matrix-matrix multiplication can be written as the tensor contraction ``A_{ij}B_{jk}``. 

Convolution is also a tensor contraction (we'll use the ⨀ symbol for convolution to distinguish it from *):
```math
\begin{aligned}
(s \odot f)_{i} &= \sum\limits_{l} s_{i-l}f{l} \\
&= s_{i-l}*f_l
\end{aligned}
```

Tensor differentiation proceeds in simple steps:

* Write out the indices on the tensor terms. Indices shared between two or more terms indicate a tensor contraction.
* Transform the tensor expression into a function graph.
* Transform the function graph into a derivative graph. Change tensor contractions into summation operation nodes.
* Find the variable being differentiated with respect to and compute index substitutions. 
* Propagate the index substitutions up the graph.