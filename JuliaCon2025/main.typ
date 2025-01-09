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
]
#slide(title: "Example")[
  Given: $f(x) = exp(cos(x)*cos(x))$ \
  find $(text("d") f(x)) / (text("d") x)$ \ \

  Let $#sym.space c = a*b, #sym.space a= cos(x) , #sym.space b= cos(x), #sym.space f(x) = exp(c)$
  $
    (text("d") f(x)) / (text("d") x) &= (text("d") exp(c)) / (text("d") x) \
    &= (partial exp(c)) / (partial c) ((partial c) / (partial a) (text("d") a) / (text("d") x)+ (partial c) / (partial b)(text("d") b) / (text("d") x)) \
    &= exp(c)(b(-sin(x)) + a(-sin(x))) && (partial a*b) / (partial a) = b, (partial a*b) / (partial b) = a\
    &= exp(c)(-(b+a)sin(x)) \
    &= exp(cos(x)*cos(x))(-(cos(x) + cos(x))sin(x)) \
    &= -2exp(cos(x)*cos(x))cos(x)sin(x)
  $
]
#slide(title: "Example in graphical form")[
  #subpar.grid(
    columns: 2,
    gutter: 50mm,
    figure(image("images/example1.svg", width: 40%), caption: "Original function"),
    figure(image("images/example1D.svg", width: 40%), caption: "Derivative graph"),
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

#show: appendix

= References

#slide(title: "References")[
  #bibliography("bibliography.bib", title: none)
]
