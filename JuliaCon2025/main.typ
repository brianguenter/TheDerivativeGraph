#import "@preview/touying:0.5.5": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")


= 

  The chain rule for a multidimensional function:
  $
    (partial f(g_1(x_1,...x_n),g_2(x_1...x_n),...g_m(x_1,...,x_n))) / (partial x_i) = sum_(j=1)^m ((partial f) / (partial g_j)) (partial g_j) / (partial x_i)
  $






= 

$  f(x) = g(h(a(x),b(x)))$ compute $ (text("d") f(x)) / (text("d") x)$

  $
    (text("d") f(x)) / (text("d") x)   &= (partial g) / (partial h) ((partial h) / (partial a) (text("d") a) / (text("d") x)+ (partial h) / (partial b)(text("d") b) / (text("d") x)) \
   &= (partial g) / (partial h) (partial h) / (partial a) (text("d") a) / (text("d") x)+(partial g) / (partial h)(partial h) / (partial b)(text("d") b) / (text("d") x)
  $

