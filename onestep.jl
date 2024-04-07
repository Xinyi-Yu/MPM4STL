τ_s = 1      # sampling time
T_h = 55     # heater temperature 
T_e = 0     # ambient temperature 
α_e = 0.06  # heat exchange coefficients
α_H = 0.08

samplecounts = 500
error = 0.1
function XU(X::IA.Interval{Float64}, U::IA.Interval{Float64}) 
    xnext = X + τ_s *(α_e *(T_e - X) + α_H*(T_h - X)*U)
    return xnext 
end

function xU(x, U::IA.Interval{Float64})
    return x + τ_s *(α_e *(T_e - x) + α_H*(T_h - x)*U)
end

function ForallxExistsu(X::IA.Interval{Float64}, U::IA.Interval{Float64}, reach::UnionSetArray, num) 
    x = []
    i = 0
    while i <= num
        i = i+1
        xnext = xU(rand(X), U)
        push!(x, xnext)
    end

    ForallxExistsu = false
    for i in 1:num
        intersect = true
        for j in 1:length(reach)
            if intersection(LazySets.Interval(x[i]), reach)[j] != LazySets.∅(1)
                break
            else
                if j == length(reach)
                    intersect = false
                end
            end
        end

        if intersect == false
            break
        else
            if i == num
                ForallxExistsu = true
            end
        end
    end 
    return ForallxExistsu
end


function ForallxForallu(X::IA.Interval{Float64}, U::IA.Interval{Float64}, reach::UnionSetArray) 
    ForallxForallu = false
    if LazySets.Interval(XU(X, U)) ⊆ reach
        ForallxForallu = true
    end
    return ForallxForallu
end


function onestepset(working::Vector{IA.Interval{Float64}}, U::IA.Interval{Float64}, reach::UnionSetArray, num, ϵ, mode) 
    inner_list = []

    while !isempty(working)
        X = pop!(working)
        if mode == 1
            flag = ForallxExistsu(X, U, reach, num)
        else
            flag = ForallxForallu(X, U, reach)
        end

        if flag == true
            push!(inner_list, X)
        else
            intersect = true
            for j in 1:length(reach)
                if intersection(LazySets.Interval(XU(X, U)), reach)[j] != IA.∅
                    break
                else
                    if j == length(reach)
                        intersect = false
                    end
                end
            end

            if (intersect == true) && (diam(X) >= ϵ)
                push!(working, bisect(X)...)
            end
        end
    end
    if inner_list != []
        return inner_list
    else
        return LazySets.∅(1)
    end
end

function onestepset(working::Vector{IA.Interval{Float64}}, U::IA.Interval{Float64}, reach::EmptySet, num, ϵ, mode) 
    return LazySets.∅(1)
end



