mutable struct Node
    const id::Symbol
    function_label::String
    derivative_label::String
    color::NTuple{3,UInt8}
    label_color::NTuple{3,UInt8}
    Node(function_label::String) = new(gensym(:node), function_label, "", white, black)
    # Node(function_label::String, color::NTuple{3,UInt8}) = new(gensym(:node), function_label, "", color)
    Node(function_label::String, derivative_label::String) = new(gensym(:node), function_label, derivative_label, white, black)
end
export Node

id(n::Node) = "\"$(n.id)\""
function_label(n::Node) = "\"$(n.function_label)\""
derivative_label(n::Node) = "\"$(n.derivative_label)\""
export derivative_label
color(n::Node) = n.color
label_color(n::Node) = n.label_color
export color

pastel(col::NTuple{3,UInt8}) = UInt8.(map(x -> min(255, x + 200), col))

export pastel

const blue = (0x00, 0x00, 0xff)
const red = (0xff, 0x00, 0x00)
const green = (0x00, 0xff, 0x00)
const white = (0xff, 0xff, 0xff)
const black = (0x00, 0x00, 0x00)
de_emph = (0xaa, 0xaa, 0xaa)
export red, green, blue, white, black, de_emph

mutable struct Edge
    const id::Symbol
    label::String
    color::NTuple{3,UInt8}
    label_color::NTuple{3,UInt8}
    const top::Node
    const bott::Node

    Edge(label::String, top::Node, bott::Node) = new(gensym(:edge), label, blue, black, top, bott)
end
export Edge

top(e::Edge) = e.top
export top
bott(e::Edge) = e.bott
export bott
id(e::Edge) = "\"e.id\""
label(e::Edge) = "\"$(e.label)\""
color(e::Edge) = e.color
label_color(e::Edge) = e.label_color

color_name(color::NTuple{3,UInt8}) = "#$(bytes2hex(color))"
color_name(n::Node) = color_name(color(n))
color_name(e::Edge) = color_name(color(e))

export color_name

function make_dot_graph()
    n1 = Node("*", red)
    n2 = Node("cos")
    n3 = Node("sin")
    n4 = Node("x", green)

    e1 = Edge("cos(x)", n1, n3)
    e2 = Edge("sin(x)", n1, n2)
    e3 = Edge("-sin(x)", n2, n4)
    e4 = Edge("cos(x)", n3, n4)

    return (e1, e2, e3, e4)
end
export make_dot_graph

function make_dot_graph(edges::NTuple{N,Edge}, function_graph=true) where {N}
    nodes = unique((top.(edges)..., bott.(edges)...))
    res = """digraph{
        ratio = 1.0
        splines = line
      """
    font_size = 12
    for node in nodes
        if function_graph
            height = 0.05
            width = 0.03
            node_label = function_label(node)
        else
            height = 0.0005
            width = 0.0005
            node_label = derivative_label(node)
        end

        res *= "$(id(node)) [color=\"$(color_name(node))\",shape=ellipse,height=$height,width=$width,fontsize=$font_size,margin = 0,fillcolor=\"$(color_name(pastel(color(node))))\",style=filled, label = $node_label , fontcolor = \"$(color_name(label_color(node)))\"] \n"
    end
    for edge in edges
        if function_graph
            edge_label = "\"\""
        else
            edge_label = label(edge)
        end
        res *= "$(id(top(edge))) -> $(id(bott(edge))) [arrowsize = 0, label=$edge_label, color=\"$(color_name(color(edge)))\", fontsize = $font_size, fontcolor = \"$(color_name(label_color(edge)))\"]\n"
    end
    res *= "}"

    return res
end
export draw_graph


function write_dot(filename, dot_string::String)
    name, ext = splitext(filename)
    name = name * ".dot"
    ext = ext[2:end] #get rid of leading dot

    io = open(name, "w")
    write(io, dot_string)
    close(io)

    Base.run(`dot -T$ext $name -o $filename`)
end
export write_dot

function draw_dot(graph::NTuple{N,Edge}, function_graph=true) where {N}
    path, io = mktemp(cleanup=true)
    name, ext = splitext(path)
    write_dot(name * ".svg", make_dot_graph(graph, function_graph))
    svg = read(name * ".svg", String)
    display("image/svg+xml", svg)
end
export draw_dot