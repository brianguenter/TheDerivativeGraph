julia> using ForwardDiff,FastDifferentiation

julia> @variables x
x

julia> f(x) = exp(exp(exp(exp(x))))
f (generic function with 1 method)

julia> ForwardDiff.derivative(f,x)
(((exp(x) * exp(exp(x))) * exp(exp(exp(x)))) * exp(exp(exp(exp(x)))))

julia> fdiff = ans
(((exp(x) * exp(exp(x))) * exp(exp(exp(x)))) * exp(exp(exp(exp(x)))))

julia> make_function([fdiff],[x])
RuntimeGeneratedFunction(#=in FastDifferentiation=#, #=using FastDifferentiation=#, :((input_variables1,)->begin
          #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:287 =#
          #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:289 =#
          begin
              #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:209 =#
              #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:178 =# @boundscheck begin
                      #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:180 =#
                      lengths = (1,)
                      #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:181 =#
                      for (input, expected_length) = zip((input_variables1,), lengths)
                          #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:182 =#
                          if length(input) != expected_length
                              #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:183 =#
                              actual_lengths = map(length, (input_variables1,))
                              #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:184 =#
                              throw(ArgumentError("The input variables must have the same length as the input_variables argument to make_function. Expected lengths: $(lengths). Actual lengths: $(actual_lengths)."))
                          end
                          #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:186 =#
                      end
                  end
          end
          #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:290 =#
          #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:290 =# @inbounds begin
                  #= C:\Users\seatt\.julia\packages\FastDifferentiation\kJ1qL\src\CodeGeneration.jl:291 =#
                  begin
                      result_element_type = promote_type(Float64, eltype.((input_variables1,))...)
                      result = Array{result_element_type}(undef, (1,))
                      var"##233" = exp(input_variables1[1])
                      var"##234" = exp(var"##233")
                      var"##232" = var"##233" * var"##234"
                      var"##235" = exp(var"##234")
                      var"##231" = var"##232" * var"##235"
                      var"##236" = exp(var"##235")
                      var"##230" = var"##231" * var"##236"
                      result[1] = var"##230"
                      return result
                  end
              end
      end))