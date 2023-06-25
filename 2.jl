#1
function fast_pow(a::T, n::Int) where T<:Any
    k=n
    p=a
    t=1
    #ИНВАРИАНТ: p^k*t=a^n
    while k>0
        if iseven(Integer(k))
            k /=2
            p *= p # - это преобразование следует из инварианта
        else
            k -= 1
            t *= p
        end
    end
    return t
end
#2
function fast_fib(a::Integer)
    matr = [0:1;; 1; 1]
    return ([0;;1]*fast_pow(matr, a))[1, 1]
end
#3
function log_2(n)
    log_Value = -1
    while (n > 0)
        log_Value = log_Value + 1
        n = n / 2
    end
    return log_Value
end

function log(a::Int64, b::Int64)
    return log_2(b) / log_2(a)
end
#4
function bisection1(f::Function, a, b, eps)
    f_a = f(a)
    while (b - a > eps)
        t = (a + b)/2
        f_t = f(t)
        if (f_t == 0)
            return t
        elseif (f_t * f_a < 0)
            b = t
        else
            a, f_a = t, f_t
        end
    end
    return (a+b) / 2
end

function f(x)
    return x * x - 3 * x
end

print(bisection1(f, -1, 2, 0.01))