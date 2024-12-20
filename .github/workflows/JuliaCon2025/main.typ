#import "@preview/touying:0.5.3": *
#import "@preview/clean-math-presentation:0.1.0": *

#show: clean-math-presentation-theme.with(
  config-info(
    title: [The Derivative Graph and its Applications],
    authors: (
      (name: "Brian Guenter", affiliation-id: 1)
    ),
    author: "Brian Guenter",
    affiliations: (
      (id: 1, name: "Thesda Institute"),
    ),
    date: datetime.today(),
  ),
  config-common(
    slide-level: 2,
    //handout: true,
    //show-notes-on-second-screen: right,
  ),
  progress-bar: false,
)

#title-slide(logo1: image("images/logo_placeholder.svg", height: 4.5em))

// == Outline <touying:hidden>

// #components.adaptive-columns(outline(title: none))

= First Section

#slide(title: "Using the template")[
  To use this template,
  - import it at the beginning of your presentation like this: `#import "@preview/clean-math-presentation:0.1.0": *`
  - import touying by `#import "@preview/touying:0.5.3": *`
  - call the `#show: clean-math-presentation-theme.with()` function to set the title, authors, and other information of your presentation.

  The title slide can be created with the `#title-slide()` command. You can pass a `background` (an image or `none`) and up to two logos `logo1` and `logo2`. \
  The outline can be included, e.g., with `#components.adaptive-columns(outline(title: none))`.\
  Normal slides can be created with `#slide()`. \
  A lot of general documentation about the Touying package can be found #link("https://touying-typ.github.io/")[in the Touying documentation]. The general #link("https://typst.app/docs/")[typst documentation] is also helpful.
]



#slide(title: "The Chain Rule")[
  The chain rule for a multidimensional function:
  $
    (partial f(g_1(x_1,...x_n),g_2(x_1...x_n),...g_m(x_1,...,x_n))) / (partial x_i) = sum_(j=1)^m ((partial f) / (partial g_j)) (partial g_j) / (partial x_i)
  $
  Breadth first evaluation example:
  $
    g_1(x,y) &= y x^2 \
    g_2(x,y) &= x y^2 \
    f(g_1(x,y),g_2(x,y)) &= g_1(x,y) g_2(x,y)
  $

  $
    (partial f) / partial(x) &= (partial f) / (partial g_1) (partial g_1(x,y)) / (partial x) + (partial f) / (partial g_2) (partial g_2(x,y)) \
    &= (partial f) / (partial g_1) (partial y x^2) / (partial x) + (partial f) / (partial g_2) (partial g_2(x,y))
  $
  Depth first evaluation:
  $
    partial f(x,y) &= exp(*(*(x,x),x)) \
    partial f(x,y) / (partial x) &= (partial exp(a)) / (partial a) (partial a) / (partial x) && && a = *(*(x,x),x) \
    &= exp(a) (partial *(b,x)) / (partial x) && b = *(x,x) \
    &= exp(a) ((partial *(b,x)) / (partial b) (partial b) / (partial x) + (partial *(b,x)) / (partial x) (partial x) / (partial x)) \
    &= exp(a) (x dot partial(*(x,x)) / (partial x)+ b dot 1) \
    &= exp(a) (x dot (partial(x) / (partial x) x + x (partial x) / (partial x)) + b dot 1) \
    &= exp(a) (x dot (x + x) + b)
  $
  Theorems can be created with the `#theorem` command. Similarly, there are `#proof`, `#definition`, `#example`, `#lemma`, and `#corollary`. \
  For example, here is a theorem:
  #theorem(title: "Important one")[
    Using theorems is easy.
  ]
  #proof[
    This was very easy, wasn't it?
  ]
  A definition already given by well-known mathematicians @Author1978definition is:
  #definition(title: "Important stuff")[
    _Important stuff_ is defined as the stuff that is important to me:
    $
      exp(upright(i) pi) + 1 = 0.
    $
  ]
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

#show: appendix

= References

#slide(title: "References")[
  #bibliography("bibliography.bib", title: none)
]
