require 'byebug'
class MaxIntSet
  attr_accessor :store
  attr_reader :max
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    is_valid?(num)
    store[num] = true
  end

  def remove(num)
    is_valid?(num)
    store[num] = false
    
  end

  def include?(num)
    is_valid?(num)
    store[num]
  end

  private

  def is_valid?(num)
    if num > max || num < 0
      raise "Out of bounds"
    end
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end
  
  def remove(num)
    i = self[num].index(num)
    self[num].delete_at(i)
  end
  
  def include?(num)
    self[num].each do |el|
      return true if el == num
    end
    false
  end
  
  private
  
  def [](num)
    store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    if !self[num].include?(num)
      if num_buckets <= count+1
        resize!
      end
      self[num].push(num)
      self.count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      self.count -= 1
    end    
  end

  def include?(num)
    self[num].each {|el| return true if el == num}
    false
  end

  private

  def [](num)
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

def my_hash(patient)
  sum = 0
  if patient.instance_of?(String)
    ref = ('a'..'z').to_a
    patient.downcase.each_char do |char|
      sum += ref.index(char).hash
    end
  elsif patient.instance_of?(Array)
    sum += patient.length.hash
    sum += my_hash(patient[0])
  elsif patient.instance_of?(Hash)
    patient.values.each do |val|
      sum += my_hash(val)
    end

  end
  sum
end

p my_hash('coconuts')
p my_hash('two of each')
p my_hash([1, 4, 5, 7])
p my_hash([1])
p my_hash({a:"hello"})
p my_hash({c:"bye"})

