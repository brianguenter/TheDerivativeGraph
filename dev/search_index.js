var documenterSearchIndex = {"docs":
[{"location":"tensors1/","page":"-","title":"-","text":"∂sum(j,Aᵢⱼbⱼ)/∂bₖ =sum(j,∂(Aᵢⱼbⱼ/∂bₖ))     = sum(j, ∂(Aᵢⱼ/∂bₖ))bⱼ + Aᵢⱼ*∂bⱼ/∂bₖ","category":"page"},{"location":"tensors1/","page":"-","title":"-","text":"∂bⱼ/∂bₖ = 0 except when j=k when it equals 1. \nCreate expression substitute(j=>k,Aᵢⱼ)\nthis gives:\n= sum(j, 0*bⱼ + substitute(j=>k,Aᵢⱼ))\n= substitute(j=>k, sum(j, Aᵢₖ))\npropagate the substitution expression up through the sum\nsum(j=k, Aᵢₖ)\n∂sum(j,Aᵢⱼ*bⱼ)/∂bₖ = Aᵢₖ","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"Computing tensor derivatives is conceptually simple, at least for tensor operations that can be represented as sequences of tensor contractions, e.g., Ab = sumlimits_j A_ijbj. From now on we'll use the notation A_ijbj to mean sumlimits_j A_ijbj","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"Differentiation proceeds in simple steps:","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"Explicitly mark the indices on all tensor terms.\nTransform the tensor expression into a function graph.\nTransform the function graph into a derivative graph. Change tensor contractions into summation operation nodes.\nFind the variable being differentiated with respect to and compute index substitutions. \nPropagate the index substitutions up the graph.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"Let's do a simple example first, before going into the details of why this works: compute fracpartial f_ipartial b_n for f_i = A_ijb_j. First, create the function graph corresponding to the expression.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"(Image: Ab)","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"Then transform this into a derivative graph","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"(Image: Ab_deriv)","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"The variable being differentiated wrt is b_n. Create the substitution sub(j=n) and apply it to the graph nodes and edges on the product path from f_j to b_j, beginning with b_j and working upward:","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"(Image: Ab_deriv1) (Image: Ab_deriv2) (Image: Ab_deriv3) (Image: Ab_deriv4)","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"∂sum(j,Aᵢⱼbⱼ)/∂bₖ =sum(j,∂(Aᵢⱼbⱼ/∂bₖ))     = sum(j, ∂(Aᵢⱼ/∂bₖ))bⱼ + Aᵢⱼ*∂bⱼ/∂bₖ","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"∂bⱼ/∂bₖ = except when j=k when it equals 1. \nCreate expression substitute(j=>k,Aᵢⱼ)\nthis gives:\n= sum(j, 0*bⱼ + substitute(j=>k,Aᵢⱼ))\n= substitute(j=>k, sum(j, Aᵢₖ))\npropagate the substitution expression up through the sum\nsum(j=k, Aᵢₖ)\n∂sum(j,Aᵢⱼ*bⱼ)/∂bₖ = Aᵢₖ","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"fracpartial b_jpartial b_k = begincases\n0   j ne k \n1  j=k\nendcases","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"Operations are scalar once they have been converted to index form. Product terms can be computed in any order (Example). This gives the AD algorithm designer great flexibility in deciding how to schedule operations on the processor.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"In the first example the summation operator sumlimits_j disappeared because the summation index and the substitution index were the same. The summation is only non-zero when the summation index equals the substitution so the summation collapse to a single term. ","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"The next example shows a case where this is not true. Given function f_k = B_kiA_ijx_j compute fracpartial f_kpartial x_n.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"The illustrations show the differentiation starting from the original function graph on the left to the final derivative on the right. At each step the substitution operation ascends one level in the graph.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"This is the function graph corresponding to f_k = B_kiA_ijx_j (Image: BAx)","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"The differentiation steps are shown in order from left to right. First the substitution variables are found by locating the variable node. In each succeeding step the substitution ascends one level in the graph.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"(Image: BAx partial) (Image: BAx partial)","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"The final derivative is shown at the far right in the figure below.","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"(Image: BAx partial) (Image: BAx partial)","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"In equation form","category":"page"},{"location":"tensors/","page":"Tensor Derivatives","title":"Tensor Derivatives","text":"fracpartial f_kpartial x_n = sumlimits_i B_kiA_in","category":"page"},{"location":"#The-Derivative-Graph-and-its-use","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"The derivative graph is a data structure that represents the derivative of a function as a graph. It is both a means of implementing efficient automatic differentiation (AD) algorithms and a more perspicuous way of analyzing and understanding these algorithms. The derivative graph is a powerful new tool which gives the developer great flexibility when designing new general purpose AD systems.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"In this document you will learn","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"how the derivative graph is related to the original function graph. \nhow the derivative graph is derived from the chain rule of Calculus.\nthat there is no fundamental difference between symbolic differentiation and automatic differentiation. You may be surprised to learn that the most efficient AD algorithms are purely symbolic.\nhow to design efficient AD algorithms using a few simple heuristics.\nhow forward and reverse are essentially the same. \nhow to improve on forward and reverse with an AD algorithm that computes efficient derivatives for any Rⁿ->Rᵐ.\nhow algorithms for computing Jv, vᵀJ, and Hv, are structurally identical; they all reduce to simple edge insertion in the derivative graph. ","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"<p style=\"text-align: center;\"> One path through derivative graph relating \\partial  </p>","category":"page"},{"location":"#The-Chain-Rule-and-the-Derivative-Graph","page":"The Derivative Graph and its use","title":"The Chain Rule and the Derivative Graph","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"sum of products of terms where each term is a partial derivative a of function node wrt to one of its children.","category":"page"},{"location":"#What-is-Automatic-Differentiation-anyway?","page":"The Derivative Graph and its use","title":"What is Automatic Differentiation anyway?","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"What is automatic differentiation? An algorithm which computes the sum of products of the edges in the derivative graph, while treating the derivative values at the edges as opaque quantities. The goal of AD algorithm development is to minimize the number of additions and multiplications required to evaluate the sum of products. There are only two ways to do this: factor out common terms and compute common subexpressions so that expressions that are more commonly used are computed before less commonly used expressions. Example:","category":"page"},{"location":"#Creating-an-AD-algorithm-from-scratch","page":"The Derivative Graph and its use","title":"Creating an AD algorithm from scratch","text":"","category":"section"},{"location":"#R-Rⁿ","page":"The Derivative Graph and its use","title":"R¹->Rⁿ","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"(Image: Path 1) (Image: Path 2)","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"(Image: Path 3)","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"(Image: Path 3) (Image: Path 3)","category":"page"},{"location":"#Rⁿ-R","page":"The Derivative Graph and its use","title":"Rⁿ->R¹","text":"","category":"section"},{"location":"#Forward-and-Reverse","page":"The Derivative Graph and its use","title":"Forward and Reverse","text":"","category":"section"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Congratulations, with two simple heuristics you have just derived the forward and reverse AD algorithms. When seen as operations on the derivative graph it is clear that these two algorithms are essentially the same. ","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Let's number the edges in the graph by postorder (explanation.). In our sum of products expressions let's order the terms in each product with smallest postorder number to the left. With this convention edges that are lower in the graph will always appear as prefixes of product terms and similarly edges higher in the graph will be suffixes. Example.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Now the fundamental similarity, and difference, between forward and reverse is clear. Forward factors out common suffix terms but computes prefix subproducts first. Reverse factors out common prefix terms but computes suffix subproducts first.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"What makes understanding forward and reverse difficult is, first, they implicitly factor the derivative graph, and, second, they also implicitly compute the most used commonly subexpressions first. It is remarkable that nearly optimal factorization and common subexpression evaluation naturally arise from these simple forward or reverse traversals of the derivative graph.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"This simplicity and efficiency only miraculously aligns for functions with special structure: f:Rⁿ->R¹ for reverse and f:R¹->Rⁿ for forward. In all other cases forward and reverse fail to optimally factor and order common subexpressions. For f:Rⁿ->Rᵐ in the worst case forward does n|E| as much work as necessary; the factor for reverse is m|E|.","category":"page"},{"location":"","page":"The Derivative Graph and its use","title":"The Derivative Graph and its use","text":"Even in the best case forward and reverse can do more work than necessary (example showing prefix and suffix factorization)","category":"page"},{"location":"#Implicit-Factorization","page":"The Derivative Graph and its use","title":"Implicit Factorization","text":"","category":"section"},{"location":"#TimeUsed","page":"The Derivative Graph and its use","title":"TimeUsed","text":"","category":"section"},{"location":"#Explicit-Factorization-and-the-FD-algorithm","page":"The Derivative Graph and its use","title":"Explicit Factorization and the FD algorithm","text":"","category":"section"},{"location":"#Jv,-vᵀJ,-and-Hv","page":"The Derivative Graph and its use","title":"Jv, vᵀJ, and Hv","text":"","category":"section"}]
}
