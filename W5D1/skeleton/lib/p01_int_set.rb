class MaxIntSet

  attr_reader :store 

  def initialize(max)
    @store = Array.new(max, false)
    # @store.each_index do |i|
    #   @store[i] = i
  
  end

  def insert(num)
    if validate!(num)
      @store[num] = true 
    else
      @store[num] = false
    end
  end

  def remove(num)
    if include?(num)
      @store[num] = false 
    end
  end

  def include?(num)
    @store[num] == true 
  end 

  private

  def is_valid?(num)
    (0...@store.length).include?(num)
  end

  def validate!(num)
    if !is_valid?(num)
      raise "Out of bounds"
      false 
    else
      return true
    end
  end
  
end


class IntSet

  attr_reader :store
   
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # trying to insert the num 50 
    # @store[50] => @store[50 % 20] => @store[10] => [50] 
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  #attr_reader :count
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num
      @count += 1 
    end
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    if self[num].delete(num) 
      @count -= 1 
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      first_store = self.store.flatten
      p first_store
      self.count = 0
      self.store = Array.new(num_buckets * 2) { Array.new }
      first_store.each do |el|
        self.insert(el)
      end
      p self.store
  end
end
