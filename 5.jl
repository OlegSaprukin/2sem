using BenchmarkTools
#1

function sort_perm!(a)
    indexes = collect(firstindex(a):lastindex(a))
    n = length(a)
    for i in 1:n
        for j in i:n
            if a[i]>a[j]
                a[i], a[j] = a[j], a[i]
                indexes[i], indexes[j] = indexes[j], indexes[i]
            end
        end
    end
    return indexes
end
 
sort_perm(a)=sort_perm!(copy(a))

#2
function bubble_sort!(a)
    n = length(a)
    for k in 1:n-1
        istranspose = false
        for i in 1:n-k
            if a[i]>a[i+1]
                a[i], a[i+1] = a[i+1], a[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return a
end

function comb_sort!(a; factor=1.2473309)
    step = length(a)
    while step >= 1
        for i in 1:length(a)-step
            if a[i] > a[i+step]
                a[i], a[i+step] = a[i+step], a[i]
            end
        end
        step = Int(floor(step/factor))
    end
    bubble_sort!(a)
end

f = randn(1000)
@time bubble_sort!(f)
f = randn(1000)
@time comb_sort!(f)



#3

function insert_sort!(vector)
    n = 1
    while n < length(vector) 
        n += 1
        i = n
        while i > 1 && vector[i-1] > vector[i]
            vector[i], vector[i-1] = vector[i-1], vector[i]
            i -= 1
        end
    end
    return vector
end

function shell_sort!(a;  step_series = (length(a)÷2^i for i in 1:Int(floor(log2(length(a))))) )
    for step in step_series
        for i in firstindex(a):lastindex(a)-step
            j = i
            while j >= firstindex(a) && a[j] > a[j+step]
                a[j], a[j+step] = a[j+step], a[j]
                j -= step
            end
        end
    end
    return a
end

function shell_sort2(arr)
    n = length(arr)
    gap = div(n, 2)
    
    while gap > 0
        for i = gap+1:n
            temp = arr[i]
            j = i
            
            while j > gap && arr[j-gap] > temp
                arr[j] = arr[j-gap]
                j -= gap
            end
            
            arr[j] = temp
        end
        
        gap = div(gap, 2)
    end
    
    return arr
end

#=
f = rand(Int, 10000)
@time shell_sort!(f)
f = rand(Int, 10000)
@time insert_sort!(f)
=#
