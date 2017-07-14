require "byebug"
class MaxIntSet

  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].each do |n|
      return true if n == num
    end

    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= num_buckets
      resize!
    end
    
    remove(num) if include?(num)
    # unless @store[num % @store.length] == [num]
      @store[num % @store.length] << num
      @count += 1
    # end
  end

  def remove(num)
    if include?(num)
      @store[num % @store.length].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    return true if @store[num % @store.length] == [num]
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count >= num_buckets
      new_store = Array.new(num_buckets * 2) {Array.new}
      @store.flatten.each do |el|
        new_store[el % new_store.length] = [el]
      end
      @store = new_store
    end

  end

end
