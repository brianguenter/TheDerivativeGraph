#import "@preview/touying:0.5.5": *
#import themes.simple: *
#import "@preview/subpar:0.2.0"

#show: simple-theme.with(aspect-ratio: "16-9")

= 

The chain rule for a multidimensional function:
  $
    (partial f(g_1(x_1,...x_n),g_2(x_1...x_n),...g_m(x_1,...,x_n))) / (partial x_i) = sum_(j=1)^m ((partial f) / (partial g_j)) (partial g_j) / (partial x_i)
  $

= "The Chain Rule"
  The chain rule for a multidimensional function:
  $
    (partial f(g_1(x_1,...x_n),g_2(x_1...x_n),...g_m(x_1,...,x_n))) / (partial x_i) = sum_(j=1)^m ((partial f) / (partial g_j)) (partial g_j) / (partial x_i)
  $






= 
    Given: 

$  f(x) = g(h(a(x),b(x)))$

compute $ (text("d") f(x)) / (text("d") x)$

  $
    (text("d") f(x)) / (text("d") x)   &= (partial g) / (partial h) ((partial h) / (partial a) (text("d") a) / (text("d") x)+ (partial h) / (partial b)(text("d") b) / (text("d") x)) \
   &= (partial g) / (partial h) (partial h) / (partial a) (text("d") a) / (text("d") x)+(partial g) / (partial h)(partial h) / (partial b)(text("d") b) / (text("d") x)
  $


#slide(title: "Funciton Graph -> Derivative Graph")[
  #subpar.grid(
    columns: 2,
    gutter: 50mm,
    figure(image("images/example1.svg", width: 100%), caption: $text("Original function:") = g(h(a(x),b(x)))$),
    figure(image("images/example1D.svg", width: 100%), caption: $text("Derivative graph") = (partial g) / (partial h) (partial h) / (partial a) (text("d") a) / (text("d") x) +
    (partial g) / (partial h)(partial h) / (partial b)(text("d") b) / (text("d") x)$
  )
  )
]

#slide(title: "Example in graphical form")[
  $
    (text("d") f(x)) / (text("d") x)   &= underbrace((partial g) / (partial h) (partial h) / (partial a) (text("d") a) / (text("d") x), "product path 1") + 
    underbrace((partial g) / (partial h)(partial h) / (partial b)(text("d") b) / (text("d") x),"product path 2")
  $
  #subpar.grid(
    columns: 2,
    gutter: 50mm,
    figure(image("images/example1_path1D.svg", width: 80%), caption: $text("product path 1") = (partial g) / (partial h) (partial h) / (partial a) (text("d") a) / (text("d") x)$),
    figure(image("images/example1_path2D.svg", width: 80%), caption: $text(fill: #green,"product path 2") = (partial g) / (partial h)(partial h) / (partial b)(text("d") b) / (text("d") x)$),
  )
]

#slide(title:"Exponential paths")[
  $(partial f_i)/(partial x_j)$ of $bold(f)(bold(x)) = [f_1(bold(x)),f_2(bold(x))...f_m (bold(x))] = text("sum of all the path products from") f_i text("to") x_j$
  #subpar.grid(
    columns: 2,
    rows: 2,
    gutter: 50mm,
    figure(image("images/exponential_paths1D.svg", height: 40%), caption: $text("product path 1") = D_1 D_3$),
    figure(image("images/exponential_paths2D.svg",  height: 40%), caption: $text("product path 2") = D_1 D_4$),
    figure(image("images/exponential_paths3D.svg",  height: 40%), caption: $text("product path 3") = D_2 D_4$),
    figure(image("images/exponential_paths4D.svg", height: 40%), caption: $text("product path 4") = D_2 D_3$),
  )
]
#slide(title: "Equations")[
  Equations with a label with a label will be numbered automatically:
  $
    integral_0^oo exp(-x^2) dif x = pi / 2
  $<eq:important>
  We can then refer to this equation as @eq:important.
  Equations without a label will not be numbered:
  $
    sum_(n=1)^oo 1 / n^2 = pi^2 / 6
  $
  Inline math equations will not break across lines, which can be seen here: $a x^2 + b x + c = 0 => x_(1,2) = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)$
]
