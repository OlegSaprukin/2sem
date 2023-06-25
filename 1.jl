#1
function gcd_(a::T, b::T) where T<:Integer
    while !iszero(b)
        a, b = b, a % b
    end
    return abs(a)
end

#2
function gcdx_(a::T, b::T) where T<:Integer 
    u, v = one(T), zero(T) 
    u1, v1 = zero(T), one(T)
    while !iszero(b)
        k = div(a, b)
        a, b = b, a - k * b
        u1, v1, u, v = u - k * u1, v - k * v1, u1, v1
    end
    if isnegative(a) 
        a, u, v = -a, -u, -v
    end
    return a, u, v 
end

isnegative(a::Integer) = (a < 0)

#3
function Base. *(a::Z{T,N}) where {T<:Integer, N}
    if gcd(a.a, N) != 1 
        return -1
    else
        f, s, d = gcdx_(a.a, N)
        return Z{T,N}(s)
    end 
end

#
function diophant(x::T, y::T, z::T) where T<:Integer
    a, b, c = gcdx_(x,y)
    return b * z , c * z
end