
"""
This function delete the emptyset in UnionSetArray
Its input is union of lazy set, UnionSetArray.
"""
function delete_emptyset(union::UnionSetArray)
    nonempty_list=[]
    for i in 1:length(union)
        if union[i] != LazySets.∅(1)
            push!(nonempty_list,i)
        end
    end
    nonempty_vector = [union[nonempty_list[i]] for i in 1: length(nonempty_list)]
    nonempty = UnionSetArray(nonempty_vector)
    return nonempty
end
function delete_emptyset(vector::EmptySet)
    return LazySets.∅(1)
end


"""
This function computes the union of unionsetarray
Its input is vector of unionsetarray, e.g., [unionsetarray1, unionsetarray2]
"""
function union_unionsetarray(working::Vector)
    temp = []
    for i in 1:length(working)
        if working[i] != LazySets.∅(1)
            for j in 1:length(working[i])
                    push!(temp, working[i][j])
            end
        end
    end
    if temp != []
        vector = [temp[i] for i in 1: length(temp)]
        union_unionsetarray = UnionSetArray(vector)
        return union_unionsetarray
    else
        return LazySets.∅(1)
    end
end

"""
This function converts vector to unionsetarray
"""
function vector2unionoflazy(vector::Vector)
    lazy_temp = []
    for i in 1:length(vector)
        x_lazy = LazySets.Interval(vector[i])
        push!(lazy_temp, x_lazy)
    end 
    vector = [lazy_temp[i] for i in 1: length(lazy_temp)]
    unionoflazyset = UnionSetArray(vector)
    return unionoflazyset
end

function vector2unionoflazy(vector::EmptySet)
    return LazySets.∅(1)
end

