module Functions
using ..GraphVisualization

function times()
  root = Node("*")
  a = Node("a")
  b = Node("b")
  e1 = Edge("b", root, a)
  e2 = Edge("a", root, b)
  return (e1, e2)
end
export times

test_graph = "strict graph { 
    a -- b
    
    a -- b
    
    b -- a [color=blue]
  } "
export test_graph

function_graph = "strict graph{
  \"*\" -- sin
  \"*\" -- cos
  cos -- x
  sin -- x
}"

dgraph1 = "strict graph{
  sin [label=\"\",shape=circle,height=0.05,width=0.05]
  cos [label=\"\",shape=circle,height=0.05,width=0.05]
  \"*\" [label=\"\",shape=circle,height=0.05,width=0.05]
  x [label = \"\",shape=circle,height=0.05,width=0.05]

  \"*\" -- sin [label=\"cos(x)\", color=red]
  \"*\" -- cos  [label=\"sin(x)\"]
  cos -- x  [label = \"-sin(x)\"]
  sin -- x  [label = \"cos(x)\",color=red]
}"


dgraph2 = "strict graph{
  sin [label=\"\",shape=circle,height=0.05,width=0.05]
  cos [label=\"\",shape=circle,height=0.05,width=0.05]
  \"*\" [label=\"\",shape=circle,height=0.05,width=0.05]
  x [label = \"\",shape=circle,height=0.05,width=0.05]

  \"*\" -- sin [label=\"cos(x)\"]
  \"*\" -- cos  [label=\"sin(x)\",color=red]
  cos -- x  [label = \"-sin(x)\",color=red]
  sin -- x  [label = \"cos(x)\"]
}"

end #module
export Functions
