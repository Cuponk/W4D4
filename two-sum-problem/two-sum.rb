def bad_two_sum?(array, target_sum)
    pair_sums = []

    array.each_with_index do |ele_1, i|
        array.each_with_index { |ele_2, j| pair_sums << ele_1 + ele_2 if i < j }
    end

    pair_sums.any? { |sum| sum == target_sum }
end

# time complexity is quadratic O(n^2)
# array = [0, 1, 5, 7]
# p bad_two_sum?(array, 6) # => true
# p bad_two_sum?(array, 10) # => false

def okay_two_sum?(array, target_sum)
    sorted = array.sort
    
    array.each_with_index do |ele, i|
        potential_y = target_sum - ele
        temp_array = array[0...i] + array[i + 1..-1]
        return true unless b_search(temp_array, potential_y).nil?
    end

    false
end

def b_search(array, target)
    return nil if array.length == 0
    center = array.length / 2

    if array[center] == target
        return center
    elsif array[center] < target
        i = b_search(array[center + 1..-1], target)
        i.nil? ? nil : center + 1 + i
    else
        b_search(array[0...center], target)
    end
end

# time complexity is linearithmic, O(nlog(n))

# array = [0, 1, 5, 7]
# p okay_two_sum?(array, 6) # => true
# p okay_two_sum?(array, 10) # => false

def two_sum?(array, target)
    bank = {} 
    
    array.each do |x|
        potential_y = target - x

        if bank[potential_y]
            return true
        else
            bank[x] = true
        end
    end
    
    false
end

# def two_sum?(array, target_sum)
#     bank = Hash.new { |h, k| h[k] = [] }
#     pairs = []

#     array.each_with_index do |x, i|
#         potential_y = target_sum - x
#         bank[x] << i
#     end

#     bank.each do |k, v|
#         potential_y = target_sum - k
#         pairs << [v, bank[potential_y]]
#     end

#     pairs
    
# end

# time complexity is linear, O(n)

array = [0, 1, 5, 7]
p two_sum?(array, 6) # => true
p two_sum?(array, 10) # => false
