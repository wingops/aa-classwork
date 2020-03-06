require 'rspec'
require 'rspec_project'
describe Array do
  describe '#remove_dups' do
    it 'removes duplicates from array' do
      expect([1,1,2,2,3,3].remove_dups).to eq([1,2,3])
    end
    it 'returns a new array' do 
      my_arr = [1,2,3,1,2,3]
      expect(my_arr.remove_dups).not_to be(my_arr.take(3))
    end
  
    it 'return elements in order they first appeared' do
      expect([1,1,3,2,2,3].remove_dups).to eq([1,3,2])
    end

  end
  
  
  
  
  
  
  
  
  
end

describe '#two_sum' do
  # it 'return indeces of pairs of elements that sum to 0' do
  #   expect([1,-1,2,0,-3,-2,3].two_sum).to eq([[0,1],[2,5],[4,6]])
  # end

  # it 'returns index of lower value first' do
  #   expect([1,-2,3,0,2,-3,-1].two_sum).to eq([[6,0],[1,4],[5,2]])
  # end

  context 'if array is empty' do
    it 'raises an error when array is empty' do
      expect { two_sum([]) }.to raise_error(StandardError)
    end
  end

end