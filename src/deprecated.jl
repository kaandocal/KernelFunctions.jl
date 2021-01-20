# TODO: remove tests when removed
@deprecate MahalanobisKernel(; P::AbstractMatrix{<:Real}) transform(
    SqExponentialKernel(), LinearTransform(sqrt(2) .* cholesky(P).U)
)

# TODO: remove keyword argument `maha` when removed
@deprecate PiecewisePolynomialKernel{V}(A::AbstractMatrix{<:Real}) where {V} transform(
    PiecewisePolynomialKernel{V}(size(A, 1)), LinearTransform(cholesky(A).U)
)

@deprecate TensorProduct(kernels) KernelTensorProduct(kernels)
@deprecate TensorProduct(kernel::Kernel, kernels::Kernel...) KernelTensorProduct(
    kernel, kernels...
)

Base.@deprecate_binding GammaRationalQuadraticKernel GammaRationalKernel
