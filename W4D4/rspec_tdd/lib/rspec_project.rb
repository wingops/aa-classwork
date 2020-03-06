class Array
  def remove_dups
    dups = Hash.new(nil)
    self.each do |ele|
      dups[ele] = 1
    end
    dups.keys
  end

  
  
  
  
  
end

def two_sum(arr)
  if arr.length == 0
    raise 'random string'
  end

  pairs = []
  arr.each_with_index do |ele, idx|
    arr.each_with_index do |el2, jdx|
      if idx > jdx && ele + el2 == 0
        pairs << [idx, jdx]
      end
    end
  end
  pairs
end

# puts "**our test**"
# puts two_sum([])
# two_sum([5])