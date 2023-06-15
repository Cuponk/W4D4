def my_min_phase_i(list)
    list.each do |ele_1|
        min = true
        list.each { |ele_2| min = false if ele_2 < ele_1 }
        return ele_1 if min
    end
end

# time complexity is quadratic, O(n^2)

def my_min_phase_ii(list)
    min = list.first
    list.each { |ele| min = ele if ele < min }
    min
end

# time complexity is linear, O(n)

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_phase_i(list)  # => -5
p my_min_phase_ii(list)  # => -5