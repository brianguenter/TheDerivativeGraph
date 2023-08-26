var documenterSearchIndex = {"docs":
[{"location":"tensors1/","page":"-","title":"-","text":"∂sum(j,Aᵢⱼbⱼ)/∂bₖ =sum(j,∂(Aᵢⱼbⱼ/∂bₖ))     = sum(j, ∂(Aᵢⱼ/∂bₖ))bⱼ + Aᵢⱼ*∂bⱼ/∂bₖ","category":"page"},{"location":"tensors1/","page":"-","title":"-","text":"∂bⱼ/∂bₖ = 0 except when j=k when it equals 1. \nCreate expression substitute(j=>k,Aᵢⱼ)\nthis gives:\n= sum(j, 0*bⱼ + substitute(j=>k,Aᵢⱼ))\n= substitute(j=>k, sum(j, Aᵢₖ))\npropagate the substitution expression up through the sum\nsum(j=k, Aᵢₖ)\n∂sum(j,Aᵢⱼ*bⱼ)/∂bₖ = Aᵢₖ","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"To compute tensor derivatives efficiently we will use a symbolic index representation. This has several benefits:","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"Unlike other tensor differentiation systems which may apply many complex tensor identities to simplify an expression we will use a single simple operation: tensor contraction.\nIn the symbolic index form all operations are scalar which gives the AD algorithm designer great flexibility to rearrange the order of operations. An important use of this feature is operator fusion. Another is tiling.\nTensor differentiation tends to create tensors that are sparse. In many cases this sparsity is explicitly represented by constraint equations on the symbolic indices. This dramatically reduces computation and memory usage.","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"Computing tensor derivatives is conceptually simple, at least for tensor operations that can be represented as sequences of tensor contraction. This may seem restrictive but tensor contraction covers a lot of territory. ","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"A tensor contraction is a summation along one or more indices. Using Einstein notation a contraction occurs whenever two terms have matching indices. For example, matrix-vector multiplication can be written as a tensor contraction","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"beginaligned\nAb = sumlimits_j A_ijbj \n= A_ijb_j\nendaligned","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"and matrix-matrix multiplication can be written as the tensor contraction A_ijB_jk. ","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"Convolution is also a tensor contraction (we'll use the ⨀ symbol for convolution to distinguish it from *):","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"beginaligned\n(s odot f)_i = sumlimits_l s_i-lfl \n= s_i-l*f_l\nendaligned","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"Tensor differentiation proceeds in simple steps:","category":"page"},{"location":"tensorintro/","page":"Introduction","title":"Introduction","text":"Write out the indices on the tensor terms. Indices shared between two or more terms indicate a tensor contraction.\nTransform the tensor expression into a function graph.\nTransform the function graph into a derivative graph. Change tensor contractions into summation operation nodes.\nFind the variable being differentiated with respect to and compute index substitutions. \nPropagate the index substitutions up the graph.","category":"page"},{"location":"theory/#Why-does-it-work?","page":"Theory","title":"Why does it work?","text":"","category":"section"},{"location":"theory/","page":"Theory","title":"Theory","text":"fracpartial b_jpartial b_k = begincases\n0   j ne k \n1  j=k\nendcases","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Let's do several examples first, before going into the details of why this works. The first example is: compute fracpartial f_ipartial A_mn for f_i = A_ijb_j. ","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"First create the function graph corresponding to the expression f_i = A_ijb_j","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"(Image: Ab)","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Now transform to a derivative graph, where Df_imn refers to the derivative fracpartial f_ipartial A_mn indexed at imn,","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"(Image: Ab_deriv) (Image: Ab_deriv)","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"In the graph on the right we've grayed out edges and nodes which don't contribute to fracpartial f_ipartial A_mn.","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Now locate the graph variable corresponding to the variable being differentiated with respect to. This is the node labeled A_ij. ","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Create a substitution rule to replace the ij indices in A_ij with mn: sub((i=mj=n)). Apply the substitution to the graph nodes and edges on the product path from f_i to A_ij, beginning with A_ij and working upward:","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"(Image: Ab_deriv1) (Image: Ab_deriv2) (Image: Ab_deriv3) (Image: Ab_deriv4)","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Notice that the substition sub((i=mj=n)sumlimitsj) collapses to a no-op. This is because the summation is zero except when j=n; there is only one term in the summation. ","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"(Image: Ab_deriv5)","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"In the final substitution change you will notice that the first index of Df is an equality constraint caused by the substition rule sub((i=mj=n)). All terms Df_imn with i ne m are identically 0.","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Now multiply all the terms on the product path from node Df_i=mmn to node A_mn. This product is Df_i=mmmn = 1*1*b_n = b_n. ","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Although the derivative has three indices imn the only non-zero elements of this tensor are the elements of b_n. Storing the tensor derivative takes space proportional to the size of b_n. This reduction in storage happens frequently when taking tensor derivatives.","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"Let's test the symbolic index result we've just computed by writing a FastDifferentiation function to compute the derivative symbolically:","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"function Ab()\n    A = make_variables(:A, 2, 2)\n    b = make_variables(:b, 2)\n\n    jac = jacobian(FD.Node.(A * b), vec(A))\n    reshape(jac, 2, 2, 2)\nend\nexport Ab","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"and here's the evaluation:","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"julia> Ab()\n2×2×2 Array{FastDifferentiation.Node, 3}:\n[:, :, 1] =\n  b1  0.0\n 0.0   b1\n\n[:, :, 2] =\n  b2  0.0\n 0.0   b2","category":"page"},{"location":"matvec/","page":"Matrix vector multiplication","title":"Matrix vector multiplication","text":"As expected the derivative is non-zero only when the first two indices are equal.","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"In the first example the summation operator sumlimits_j disappeared because the summation index and the substitution index were the same. The summation is only non-zero when the summation index equals the substitution so the summation collapse to a single term. ","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"The next example shows a case where this is not true: given f_k = B_kiA_ijx_j compute fracpartial f_kpartial x_n.","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"First create the function graph corresponding to f_k = B_kiA_ijx_j (Image: BAx)","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"Now transform to a derivative graph and gray out edges and nodes which do not contribute to the derivative: (Image: BAx partial)","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"Create the substitution rule by locating  by locating the variable node x_j.","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"(Image: BAx partial)","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"Apply the substitution rule up the graph","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"(Image: BAx partial) (Image: BAx partial)","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"No terms higher in the graph than the sumlimits_j node use the index j so none of them are affected by the substitution rule sub((j=n)).  ","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"(Image: BAx partial)","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"The final result is","category":"page"},{"location":"matmat/","page":"Matrix matrix multiplication","title":"Matrix matrix multiplication","text":"fracpartial f_kpartial x_n = Df_kn= sumlimits_i B_kiA_in","category":"page"},{"location":"#The-Derivative-Graph-and-its-use","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"The derivative graph is a data structure that represents the derivative of a function as a graph. It is both a means of implementing efficient automatic differentiation (AD) algorithms and a more perspicuous way of analyzing and understanding these algorithms. The derivative graph is a powerful new tool which gives the developer great flexibility when designing new general purpose AD systems.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"In this document you will learn","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"how the derivative graph is related to the original function graph. \nhow the derivative graph is derived from the chain rule of Calculus.\nthat there is no fundamental difference between symbolic differentiation and automatic differentiation. You may be surprised to learn that the most efficient AD algorithms are purely symbolic.\nhow to design efficient AD algorithms using a few simple heuristics.\nhow forward and reverse are essentially the same. \nhow to improve on forward and reverse with an AD algorithm that computes efficient derivatives for any Rⁿ->Rᵐ.\nhow algorithms for computing Jv, vᵀJ, and Hv, are structurally identical; they all reduce to simple edge insertion in the derivative graph. ","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"<p style=\"text-align: center;\"> One path through derivative graph relating \\partial  </p>","category":"page"},{"location":"#The-Chain-Rule-and-the-Derivative-Graph","page":"The Derivative Graph and its use","title":"The Chain Rule and the Derivative Graph","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"sum of products of terms where each term is a partial derivative a of function node wrt to one of its children.","category":"page"},{"location":"#What-is-Automatic-Differentiation-anyway?","page":"The Derivative Graph and its use","title":"What is Automatic Differentiation anyway?","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"What is automatic differentiation? An algorithm which computes the sum of products of the edges in the derivative graph, while treating the derivative values at the edges as opaque quantities. The goal of AD algorithm development is to minimize the number of additions and multiplications required to evaluate the sum of products. There are only two ways to do this: factor out common terms and compute common subexpressions so that expressions that are more commonly used are computed before less commonly used expressions. Example:","category":"page"},{"location":"#Creating-an-AD-algorithm-from-scratch","page":"The Derivative Graph and its use","title":"Creating an AD algorithm from scratch","text":"","category":"section"},{"location":"#R-Rⁿ","page":"The Derivative Graph and its use","title":"R¹->Rⁿ","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"(Image: Path 1) (Image: Path 2)","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"(Image: Path 3)","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"(Image: Path 3) (Image: Path 3)","category":"page"},{"location":"#Rⁿ-R","page":"The Derivative Graph and its use","title":"Rⁿ->R¹","text":"","category":"section"},{"location":"#Forward-and-Reverse","page":"The Derivative Graph and its use","title":"Forward and Reverse","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Congratulations, with two simple heuristics you have just derived the forward and reverse AD algorithms. When seen as operations on the derivative graph it is clear that these two algorithms are essentially the same. ","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Let's number the edges in the graph by postorder (explanation.). In our sum of products expressions let's order the terms in each product with smallest postorder number to the left. With this convention edges that are lower in the graph will always appear as prefixes of product terms and similarly edges higher in the graph will be suffixes. Example.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Now the fundamental similarity, and difference, between forward and reverse is clear. Forward factors out common suffix terms but computes prefix subproducts first. Reverse factors out common prefix terms but computes suffix subproducts first.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"What makes understanding forward and reverse difficult is, first, they implicitly factor the derivative graph, and, second, they also implicitly compute the most used commonly subexpressions first. It is remarkable that nearly optimal factorization and common subexpression evaluation naturally arise from these simple forward or reverse traversals of the derivative graph.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"This simplicity and efficiency only miraculously aligns for functions with special structure: f:Rⁿ->R¹ for reverse and f:R¹->Rⁿ for forward. In all other cases forward and reverse fail to optimally factor and order common subexpressions. For f:Rⁿ->Rᵐ in the worst case forward does n|E| as much work as necessary; the factor for reverse is m|E|.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Even in the best case forward and reverse can do more work than necessary (example showing prefix and suffix factorization)","category":"page"},{"location":"#Implicit-Factorization","page":"The Derivative Graph and its use","title":"Implicit Factorization","text":"","category":"section"},{"location":"#TimeUsed","page":"The Derivative Graph and its use","title":"TimeUsed","text":"","category":"section"},{"location":"#Explicit-Factorization-and-the-FD-algorithm","page":"The Derivative Graph and its use","title":"Explicit Factorization and the FD algorithm","text":"","category":"section"},{"location":"#Jv,-vᵀJ,-and-Hv","page":"The Derivative Graph and its use","title":"Jv, vᵀJ, and Hv","text":"","category":"section"}]
}
