
```math
g_i = \sum\limits_{l} s_{i-l}f_{l + half + 1}
```

```math
\begin{aligned}
		g_i &= \sum\limits_{l} s_{i-l}f_{l + half + 1} \\
	\frac{\partial g_i}{\partial s_u} &= \sum\limits_{l} \frac{\partial s_{i-l}f_{l + half + 1}}{\partial s_u} \\
	&= \sum\limits_{l} ({\scriptsize \cancelto{\begin{cases}
		1 & i-l=u, \\
	    0  & i-l \ne u
		\end{cases}}{\frac{\partial s_{i-l}}{\partial s_u}}}{f_{l + half + 1}} + s_{i-l} \cancelto{0}{\frac{\partial_{f_{l + half + 1}}}{\partial s_u}}) \\
	&= f_{i-u+half+1}
\end{aligned}
```

```math
\frac{\partial b_j}{\partial b_k} = \begin{cases}
0  & j \ne k, \\
1 & j=k
\end{cases}
```