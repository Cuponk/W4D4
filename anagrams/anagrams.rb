def anagram_phase_i?(str_1, str_2)
    anagrams = str_1.split("").permutation.to_a
    anagrams.include?(str_2.split(""))
end

# time complexity is factorial, O(n!)
# this would get very slow very quickly as input strings increased in length

# p anagram_phase_i?("gizmo", "sally")    #=> false
# p anagram_phase_i?("elvis", "lives")    #=> true

# def anagram_phase_ii_test?(str_1, str_2)
#     arr_1 = str_1.split('')
#     arr_2 = str_2.split('')
#     (0...arr_1.length).each { |i| arr_2.delete_at(arr_2.find_index(arr_1[i])) if arr_2.include?(arr_1[i]) }
        
#     end
#     arr_2.empty?
# end

def anagram_phase_ii?(str_1, str_2)
    str_1.each_char do |char|
        i = str_2.index(char)
        str_2[i] = "" unless i.nil?
    end

    str_2.length == 0
end

# time complexity is linear, O(n)

# p anagram_phase_ii?("gizmo", "sally")    #=> false
# p anagram_phase_ii?("elvis", "lives")    #=> true

def anagram_phase_iii?(str_1, str_2)
    str_1.chars.sort == str_2.chars.sort
end

# time complexity is linearithmic, O(nlog(n))

# p anagram_phase_iii?("gizmo", "sally")    #=> false
# p anagram_phase_iii?("elvis", "lives")    #=> true

def anagram_phase_iv?(str_1, str_2)
    count_1 = Hash.new(0)
    count_2 = Hash.new(0)

    str_1.each_char { |char| count_1[char] += 1 }
    str_2.each_char { |char| count_2[char] += 1 }

    count_1 == count_2
end

# p anagram_phase_iv?("gizmo", "sally")    #=> false
# p anagram_phase_iv?("elvis", "lives")    #=> true

def anagram_phase_iv_bonus?(str_1, str_2)
    count = Hash.new(0)

    str_1.each_char { |char| count[char] += 1 }
    str_2.each_char { |char| count[char] -= 1 }

    count.all? { |k, v| v == 0 }
end

# time complexity is linear, O(n)

# p anagram_phase_iv_bonus?("gizmo", "sally")    #=> false
# p anagram_phase_iv_bonus?("elvis", "lives")    #=> true
