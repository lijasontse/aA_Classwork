def first_anagram?(str_1, str_2) #O(n * n!)
    p_str = str_1.split("").permutation(str_1.length).to_a
    p_str.include?(str_2.split(""))
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str_1, str_2) #O(n^2) : quadratic
    return false if str_1.length != str_2.length 
    arr_2 = str_2.split("")
    str_1.each_char do |char|
        idx2 = arr_2.find_index(char) #another iteration, searching through arr, n 
        unless idx2.nil?
            arr_2.delete_at(idx2) #another iteration, * 2
        end 
    end
    arr_2.length == 0  
end

# p second_anagram?("bat", "bats")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str_1, str_2) #quicksort : O(n log n)
    arr_1 = str_1.split("")
    arr_2 = str_2.split("")
    arr_1.sort == arr_2.sort 
end

# p third_anagram?("bat", "bats")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str_1, str_2) #O(n)
    counts = Hash.new(0)
    str_1.each_char { |char_1| counts[char_1] += 1 }
    str_2.each_char { |char_2| counts[char_2] -= 1 }
    counts.values.all? { |v| v == 0 }
    # char_count(str_1) == char_count(str_2)
end

# def char_count(str)
#     count = Hash.new(0)
#     str.each_char { |char| count[char] += 1 }
#     count 
# end

p fourth_anagram?("bat", "bats")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true