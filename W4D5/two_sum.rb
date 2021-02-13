def bad_two_sum?(arr, target_sum)
    arr.each.with_index do |ele1, i| #n^2
        arr.each.with_index do |ele2, j|
            if j > i && ele1 + ele2 == target_sum
                return true
            end
        end
    end
    return false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
require 'byebug'
def okay_two_sum?(arr, target_sum)
    debugger
    sorted = arr.sort 
    return false if sorted.empty?
    target = target_sum - sorted[-1]
    
    result = bsearch(sorted, target)
    if result.nil? 
        sorted.pop 
        okay_two_sum?(sorted, target_sum)
    else
        true 
    end
end

def bsearch(arr, target)
    return nil if arr.length <= 1 
    mid_idx = arr.length / 2
    left = arr[0...mid_idx]
    right = arr[mid_idx+1..-1]
    return mid_idx if arr[mid_idx] == target 

    if target > arr[mid_idx]
        result = bsearch(right, target)
        result.nil? ? nil : result + mid_idx + 1 
    else
        result = bsearch(left, target)
        result.nil? ? nil : result 
    end
end

arr_1 = [1, 2, 3, 4, 5] 
p okay_two_sum?(arr_1, 3)

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
