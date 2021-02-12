class Array

    def my_uniq
      
      result = []
      self.each { |ele|  result << ele if !result.include?(ele)}
      result
    end

    def two_sum
        pairs = []
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1 && ele1 + ele2 == 0 
                    pairs << [idx1, idx2]
                end
            end
        end
        pairs
    end

    def my_transpose
      sub = []
      (0...self.length).each do |i|
        sub_sub = []
        (0...self.length).each do |j|
            sub_sub << self[j][i]
        end
        sub << sub_sub
      end
      sub
    end
end

  def stock_picker(array)
    hash = Hash.new {|h, k| h[k] = 0 }
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if idx2 > idx1 
                hash[[idx1, idx2]] = (array[idx2] - array[idx1])
            end
        end
    end
    # return hash
    max = 0
    max_idx = [0, 1]
    hash.select do |k, v| 
      if v > max
        max = v
        max_idx = k
      end
    end
      max_idx        
  end
  
stock_prices = [100, 500, 200, 300, 700, 700] 
stock_prices_2 = [100, 100, 100, 100] 
p stock_picker(stock_prices)
p stock_picker(stock_prices_2)

