require "tdd.rb"


  describe Array do
    subject(:array) {  array = [1, 2, 1, 3, 3] }
    describe  "#my_uniq" do      
      it "should remove duplicates from the array and return a new array with unique elements in the order they first appeared in the original array" do
        expect(array.my_uniq).to eq([1, 2, 3])
      end

      it "should not use Array#uniq on the array to calculate the answer" do
        expect(array).to_not receive(:uniq)
        array.my_uniq
      end
    end

    let(:array2) { array2 = [-1, 0, 2, -2, 1] }
    describe "#two_sum" do
        it "should find all positions of pairs of the array that add to 0" do
            expect(array2.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "should return [] when no pairs add to 0" do
            expect(array.two_sum).to eq([])
        end

        it "the pairs should be sorted smaller index before bigger index" do
            expect(array2.two_sum).to_not eq([[2, 3], [0, 4]])
            expect(array2.two_sum).to eq([[0, 4], [2, 3]])
        end

    end 
    
    describe "#my_transpose" do
      it "should convert 2D array between the row-oriented and column-oriented representations and returns the new tranposed 2D array" do  
        arr_1 = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]

        expected_1 = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]

      expect(arr_1.my_transpose).to eq(expected_1)
    end
    
    it "should not use Array#transpose" do
        arr_1 = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      expect(arr_1).to_not receive(:transpose)
      arr_1.my_transpose
    end
  end  
end

describe "stock_picker(array)" do 
    it "should find the most profitable pair of days in a new array on which to first buy the stock and then sell the stock" do
        stock_prices = [100, 500, 200, 300, 700, 700] 
        expect(stock_picker(stock_prices)).to eq([0, 4])
        stock_prices_2 = [100, 100, 100, 100] 
        expect(stock_picker(stock_prices_2)).to eq([0, 1])
    end

    it "should return the earlier pair of days that is most profitable" do
        stock_prices = [100, 500, 200, 300, 700, 700] 
        expect(stock_picker(stock_prices)).to_not eq([0, 5])
        expect(stock_picker(stock_prices)).to eq([0, 4])
    end

    it "should make sure smaller index comes first in the array followed by the bigger index" do
        stock_prices = [100, 500, 200, 300, 700, 700] 
        expect(stock_picker(stock_prices)).to_not eq([4, 0])
    end
end
