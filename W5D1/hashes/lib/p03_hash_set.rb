class HashSet
#   attr_reader :count

#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(key)
#   end

#   def include?(key)
#   end

#   def remove(key)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#   end
# end


# class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    num = num.hash
    
    if !self[num].include?(num)
      if num_buckets <= count+1
        resize!
      end
      self[num].push(num)
      self.count += 1
    end
  end
  
  def remove(num)
    num = num.hash
    if self[num].include?(num)
      self[num].delete(num)
      self.count -= 1
    end    
  end
  
  def include?(num)
    num = num.hash
    self[num].each {|el| return true if el == num}
    false
  end
  
  private
  
  def [](num)
    num = num.hash
    # optional but useful; return the bucket corresponding to `num`
    store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store.concat(Array.new(num_buckets){ Array.new })
    store.each do |sub_arr|
      length = sub_arr.length
      length.times do 
        temp = sub_arr.pop
        self[temp].push(temp)
      end
    end
  end
end