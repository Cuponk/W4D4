require "byebug"

def largest_contiguous_subsum_phase_i(array)
    subsets = []

    (0...array.length).each do |i|
        (0...array.length).each { |j| subsets << array[i..j].sum if i <= j }
    end

    subsets.max
end

# time complexity is quadratic, O(n^2)

def largest_contiguous_subsum_phase_ii(array)
    largest_sum = array.first
    current_sum = array.first

    array[1..-1].each do |ele|
        if current_sum < 0
            current_sum = 0
        end

        current_sum += ele
        largest_sum = current_sum if current_sum > largest_sum
    end

    largest_sum
end

# time complexity is linear, O(n)

list_1 = [5, 3, -7]
list_2 = [2, 3, -6, 7, -6, 7]
list_3 = [-5, -1, -3]

# p largest_contiguous_subsum_phase_i(list_1) # => 8 (from [5, 3])
# p largest_contiguous_subsum_phase_i(list_2) # => 8 (from [7, -6, 7])
# p largest_contiguous_subsum_phase_i(list_3) # => -1 (from [-1])

p largest_contiguous_subsum_phase_ii(list_1) # => 8 (from [5, 3])
p largest_contiguous_subsum_phase_ii(list_2) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum_phase_ii(list_3) # => -1 (from [-1])