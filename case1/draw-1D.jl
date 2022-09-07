const blue = RGB(0.9, 0.9, 1)
const darkblue = RGB(0, 0, 0.7)
const red = RGB(0.7, 0, 0)

"""
This function convert interval to rectangle.
Its input is UnionSetArray of lazyset
"""
function interval2rect(working::UnionSetArray, k)
    rect_temp = []
    for i in 1:length(working)
        c = [k, LazySets.center(working[i])[1]]
        r = [0.5, 0.5*LazySets.diameter(working[i])]
        interval_rect = Hyperrectangle(c, r)
        push!(rect_temp, interval_rect)
    end 
    rect = [rect_temp[i] for i in 1: length(rect_temp)]
    union_rect = UnionSetArray(rect)

    return union_rect
end


function draw(X_2_fz, X_1and2_fz, X_2_sat, X_1and2_sat)
    # draw feasible set
    plot(interval2rect(X_2_fz[1], 15), color=blue, alpha = 1, label = L"X_k^{\{2\}}", draw_arrow = true, legendfontsize = 8)
    for i in 2:length(X_2_fz)
        if X_2_fz[i] != LazySets.∅(1)
            plot!(interval2rect(X_2_fz[i], 16-i), color=blue, alpha = 1, draw_arrow = true)
        end
    end
    if X_1and2_fz[1] != LazySets.∅(1)
        plot!(interval2rect(X_1and2_fz[1], 8), color=darkblue, alpha = 1, fillstyle = :\, label = L"X_k^{\{1,2\}}", draw_arrow = true)
    end
    for i in 2:length(X_1and2_fz)
        if X_1and2_fz[i] != LazySets.∅(1)
            plot!(interval2rect(X_1and2_fz[i], 9-i), color=darkblue, alpha = 1, fillstyle = :\, draw_arrow = true)
        end
    end
    
    
    # draw satisfiable set
    plot!(interval2rect(X_2_sat[1], 15), color=red, alpha = 1, fillstyle = :\, label = L"Y_k^{\{2\}}", draw_arrow = true)
    for i in 2:length(X_2_sat)
        if X_2_sat[i] != LazySets.∅(1)
            plot!(interval2rect(X_2_sat[i], 16-i), color=red, alpha = 1, fillstyle = :\, draw_arrow = true)
        end
    end
    if X_1and2_sat[1] != LazySets.∅(1)
        plot!(interval2rect(X_1and2_sat[1], 8), color=red, alpha = 1, fillstyle = :\, label = L"Y_k^{\{1,2\}}", draw_arrow = true)
    end
    for i in 2:length(X_1and2_sat)
        if X_1and2_sat[i] != LazySets.∅(1)
            plot!(interval2rect(X_1and2_sat[i], 9-i), color=red, alpha = 1, fillstyle = :\, draw_arrow = true)
        end
    end
    
    xlabel!("Instants")
    ylabel!("Temperature")
end

function draw_lines()
    x1 = [-0.5, 0.5, 0.5, 1.5, 1.5, 2.5, 2.5, 3.5, 3.5, 4.5]
    y1 = [0, 0, 1, 1, 5.2, 5.2, 8.2, 8.2, 8.5, 8.5]

    x2 = [-0.5, 0.5, 0.5, 1.5, 1.5, 2.5, 2.5, 3.5, 3.5, 4.5, 4.5, 5.5, 5.5, 6.5, 6.5, 7.5, 7.5, 8.5, 8.5, 9.5, 9.5, 10.5]
    y2 = [10, 10, 10.5, 10.5, 13, 13, 15, 15, 17.3, 17.3, 19.2, 19.2, 20.5, 20.5, 21, 21, 19.8, 19.8, 18.7, 18.7, 17.6, 17.6]

    x3 = [-0.5, 0.5, 0.5, 1.5, 1.5, 2.5, 2.5, 3.5, 3.5, 4.5, 4.5, 5.5, 5.5, 6.5, 6.5, 7.5, 7.5, 8.5, 8.5, 9.5, 9.5, 10.5, 10.5, 11.5, 11.5, 12.5, 12.5, 13.5, 13.5, 14.5]
    y3 = [30, 30, 28.5, 28.5, 26.8, 26.8, 25.5, 25.5, 24, 24, 22.6, 22.6, 23.8, 23.8, 24.8, 24.8, 25.5, 25.5, 26.3, 26.3, 24.8, 24.8, 23.5, 23.5, 23.5, 23.5, 23, 23, 22.6, 22.6]

    plot!(x1,y1, linewidth = 2, linecolor = :blue, label = nothing)
    plot!(x2,y2, linewidth = 2, linecolor = :blue, label = nothing)
    plot!(x3,y3, linewidth = 2, linecolor = :red, label = nothing)
end