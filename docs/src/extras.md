## Unused stuff that may be useful in a later revision

```math
\begin{aligned}
	\frac{\partial g_i}{\partial s_u} &= \sum\limits_{l} (\frac{\partial s_{i-l}}{\partial s_u}{f_{l + half + 1}} + s_{i-l} \frac{\partial_{f_{l + half + 1}}}{\partial s_u}) 
 \end{aligned}
```

The second term in the sum `` \frac{\partial_{f_{l + half + 1}}}{\partial s_u}`` is identically zero. The first term ``\frac{\partial s_{i-l}}{\partial s_u}`` is non-zero only when ``i-l=u`` so the sum collapses to a single element. Solving for ``l`` and substituting into ``f_{l + half + 1}``:

```math
\frac{\partial g_i}{\partial s_u} = f_{i-u + half + 1}
```
