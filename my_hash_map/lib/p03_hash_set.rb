require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # key = key.hash
    if @count >= num_buckets
      resize!
    end
    
    remove(key) if include?(key)
    @store[key.hash % @store.length] << key
    @count += 1
  end

  def include?(key)
    # key = key.hash
    @store[key.hash % @store.length].each do |el|
      return true if el == key
    end

    false
  end

  def remove(key)
    # key = key.hash
    if include?(key)
      @store[key.hash % @store.length].delete(key)
      @count -= 1
    end
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
        new_store[el.hash % new_store.length] = [el]
      end
      @store = new_store
    end
  end
end
