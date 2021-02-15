struct DotProduct <: AbstractBinaryOp end
# struct DotProduct <: Distances.UnionSemiMetric end


(d::DotProduct)(a, b) = Distances.evaluate(d, a, b)
Distances.evaluate(::DotProduct, a, b) = dot(a, b)

function Distances._pairwise!(P::AbstractMatrix, ::KernelFunctions.DotProduct, a::AbstractMatrix, b::AbstractMatrix=a)
    return mul!(P, transpose(a), b)
end

# @inline function Distances._evaluate(::DotProduct, a::AbstractVector, b::AbstractVector)
#     @boundscheck if length(a) != length(b)
#         throw(DimensionMismatch("first array has length $(length(a)) which does not match the length of the second, $(length(b))."))
#     end
#     return dot(a,b)
# end

# Distances.result_type(::DotProduct, Ta::Type, Tb::Type) = promote_type(Ta, Tb)

# @inline Distances.eval_op(::DotProduct, a::Real, b::Real) = a * b
# @inline (dist::DotProduct)(a::AbstractArray,b::AbstractArray) = Distances._evaluate(dist, a, b)
# @inline (dist::DotProduct)(a::Number,b::Number) = a * b
