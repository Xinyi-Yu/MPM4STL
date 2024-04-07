
"""
This function computes the current two kinds of feasible set for instants 1-8;
    if mode=1, compute one-step feasible set; else compute onestep satisfiable set.
"""
function case1(next2, next1and2, mode)
    onestep2next2_vector = onestepset([X], U, next2, samplecounts, error, mode)
    onestep2next1and2_vector = onestepset([X], U, next1and2, samplecounts, error, mode)
    onestep2next2 = vector2unionoflazy(onestep2next2_vector)
    onestep2next1and2 = vector2unionoflazy(onestep2next1and2_vector)

    current1and2_part1 = delete_emptyset(intersection(onestep2next2, Omega))
    current1and2_part2 = onestep2next1and2

    current1and2 = union_unionsetarray([current1and2_part1, current1and2_part2])
    current2 = onestep2next2
    return current1and2, current2
end
# function case1(next2::EmptySet, next1and2::EmptySet, mode)
#     return LazySets.∅(1), LazySets.∅(1)
# end

"""
This function computes the current two kinds of feasible set for instants 10-15;
    if mode=1, compute one-step feasible set; else compute onestep satisfiable set.
"""
function case2(next2::UnionSetArray, mode)
    onestep2next2_vector = onestepset([X], U, next2, samplecounts, error, mode)
    onestep2next2 = vector2unionoflazy(onestep2next2_vector)
    current2 = delete_emptyset(intersection(onestep2next2, Omega))
    return current2
end

function case2(next2::EmptySet, mode)
        return LazySets.∅(1)
end


function off_comp(mode)
    X_16_empty = UnionSetArray([LazySets.Interval(-100,100)]);
    # X_15^{2}
    X_15_2 = case2(X_16_empty, mode);
    # X_14^{2}
    X_14_2 = case2(X_15_2, mode);
    # X_13^{2}
    X_13_2 = case2(X_14_2, mode);
    # X_12^{2}
    X_12_2 = case2(X_13_2, mode);
    # X_11^{2}
    X_11_2 = case2(X_12_2, mode);
    # X_10^{2}
    X_10_2 = vector2unionoflazy(onestepset([X], U, X_11_2, samplecounts, error, mode));
    # X_9^{2}
    X_9_2 = vector2unionoflazy(onestepset([X], U, X_10_2, samplecounts, error, mode));
    # X_8^{1,2}
    onestep2X_9_2 = vector2unionoflazy(onestepset([X], U, X_9_2, samplecounts, error, mode));
    X_8_1and2 = delete_emptyset(intersection(onestep2X_9_2, Omega));
    # X_8^{2}
    X_8_2 = onestep2X_9_2;
    # X_7^{1,2} and X_7^{2}
    X_7_1and2, X_7_2 = case1(X_8_2, X_8_1and2, mode);
    # X_6^{1,2} and X_6^{2}
    X_6_1and2, X_6_2 = case1(X_7_2, X_7_1and2, mode);
    # X_5^{1,2} and X_5^{2}
    X_5_1and2, X_5_2 = case1(X_6_2, X_6_1and2, mode);
    # X_4^{1,2} and X_4^{2}
    X_4_1and2, X_4_2 = case1(X_5_2, X_5_1and2, mode);
    # X_3^{1,2} and X_3^{2}
    X_3_1and2, X_3_2 = case1(X_4_2, X_4_1and2, mode);
    # X_2^{1,2} and X_2^{2}
    X_2_1and2, X_2_2 = case1(X_3_2, X_3_1and2, mode);
    # X_1^{1,2} and X_1^{2}
    X_1_1and2, X_1_2 = case1(X_2_2, X_2_1and2, mode);
    # X_0^{1,2} and X_0^{2}
    X_0_1and2, X_0_2 = case1(X_1_2, X_1_1and2, mode);
    
    X_2 = [X_15_2, X_14_2, X_13_2, X_12_2, X_11_2, X_10_2, X_9_2, X_8_2, X_7_2, X_6_2, X_5_2, X_4_2, X_3_2, X_2_2, X_1_2, X_0_2];
    X_1and2 = [X_8_1and2, X_7_1and2, X_6_1and2, X_5_1and2, X_4_1and2, X_3_1and2, X_2_1and2, X_1_1and2, X_0_1and2];

    return X_2, X_1and2
end







