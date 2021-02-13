def my_min(array) # O(n^2)
    min = 0
    (0...array.length).each do |i| 
        (i+1...array.length).each do |j|
            if array[i] < array[j] && array[i] < min 
                min = array[i]
            end
        end
    end
    min
end

def my_fast_min(array)
    min = 0
    (0...array.length).each do |i|
        if array[i] < min 
            min = array[i]
        end
    end
    min 
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_fast_min(list)

def largest_continuous_subsum(array) #2n^2 -> O(n^2)
  pairs = []
  array.each.with_index do |ele1, i| #n^2
    array.each.with_index do |ele2, j|
      if j > i
        pairs << [ele1, ele2]
      end
    end
  end
  max_sum = 0
  pairs.each do |pair| #n^2
    sum = pair.sum
    max_sum = sum if sum > max_sum
  end
  max_sum
end

# p largest_continuous_subsum([5,3,-7]) #8
# #8 because 5 and 3 is the largest l

# p largest_continuous_subsum([5,3,-7]) #8
# p largest_continuous_subsum([1,5,3,-7]) #9
# p largest_continuous_subsum([-5,-3,-1]) #-1
# p largest_continuous_subsum([2, 3, -6, 7, -6, 7]) #8


def largest_contiguous(array)
  subs = []
  (0...array.length).each do |start_idx| #n
    (start_idx...array.length).each do |end_idx| #n * 1/2
      subs << array[start_idx..end_idx] #when grabbing subarr using range, this is another n
    end
  end
  p subs
  largest_sum = nil
  subs.each do |sub| #n^2
    largest_sum = sub.sum if largest_sum.nil? || sub.sum > largest_sum #.sum is doing another n, becoming n^3 = n * n2
  end
  largest_sum
end

#tetrahedron 

# p largest_contiguous([5,3,-7]) #8
# p largest_contiguous([1,5,3,-7]) #9
# p largest_contiguous([-5,-3,-1]) #-1
# p largest_contiguous([2, 3, -6, 7, -6, 7]) #8


#Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

def lc(array) #[5,3,-7]
  largest_sum = array[0] #5 #8
  current_sum = array[0]

  (0...array.length-1).each do |i|
    num = array[i+1] #3
    current_sum = largest_sum + num #8
    largest_sum = current_sum if current_sum > largest_sum 
    largest_sum = num if num > largest_sum 
    #how to reset current sum?
  end
  largest_sum
end

def kadane(array)
  largest = array[0]
  current = array[0]

  (1...array.length).each do |i|
    current += array[i]
    if largest < current
      largest = current
    elsif current < 0
      current = 0
    end
  end
  return largest
end

p kadane([5,3,-7]) #8
p kadane([1,5,3,-7]) #9
p kadane([-5,-3,-1]) #-1
p kadane([2, 3, -6, 7, -8, 7]) #7


def internet(array)
  largest_sum = nil

  total_sum = nil
  n = array.length
  #single loop
  (0...array.length).each do |i|
    sum = array[i] * (n-i) * (i+1) #5 * 3 * 1 #3 * 2 * 2 #
    if total_sum.nil?
      total_sum = sum
    elsif total_sum + sum > total_sum
    total_sum += sum
    end
  end
  return total_sum
end

#https://algorithms.tutorialhorizon.com/sum-of-all-sub-arrays-in-on-time/ 
# p internet([5,3,-7]) #8
# p internet([1,5,3,-7]) #9
# p internet([-5,-3,-1]) #-1
# p internet([2, 3, -6, 7, -6, 7]) #8



# def lcs(array) #[-1, 5,3, -7]
#   mid = array.length/2 #mid = 2
#   left = array[0...mid].sum #4 #7
#   right = array[mid..-1].sum #-3 #-7
#   while right > left 
#     mid = mid - 1
#     new_right = array[mid..-1].sum
#     if new_right > right
#       right = new_right 
#       left = array[0...mid]
#     else
#       #return right
#     end
#   end
#   while left > right 
#     mid = mid + 1 #4
#     new_left = array[0...mid].sum  #[-1, 5, 3 -7] => 0
#     if new_left > left 
#       left = new_left
#       right = array[mid..-1] 
#     else
#       #return left
#     end
#   end

#   mid is now the leftmost positive??
# end



#[-1,1,-2,3,4,5,6, -1]
#pick a pivot in the middle
#find sum of left
#find sum of right
#if right > left,
  #save sum(right) to a var
  #move pivot one to the left
  #check sum(new_right) vs. sum(right)
  #if new_right is bigger, repeat
  #elsif sum(right) if bigger, stop and do flipped version to account for poss. negatives on the other side



# p lcs([5,3,-7]) #8
# p lcs([1,5,3,-7]) #9
# p lcs([-5,-3,-1]) #-1
# p lcs([2, 3, -6, 7, -6, 7]) #8