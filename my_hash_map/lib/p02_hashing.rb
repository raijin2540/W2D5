class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    str = ""
    self.each_with_index do |el, idx|
      str += (el.to_s + idx.to_s)
    end

    str.to_i.hash.to_i
  end
end

class String
  def hash
    arr = self.split("").map { |el| el.ord}
    str = ""
    arr.each_with_index do |el, idx|
      str += (el.to_s + idx.to_s)
    end

    str.to_i.hash.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = []
    self.to_a.sort.each_with_index do |tuple, idx|
      tuple << idx
      arr << tuple.map {|el| el.to_s}
    end
    arr.flatten.join.hash.to_i
    # arr.join.str = ""
    # self.each_with_index do |el, idx|
    #   str += (el.to_s + idx.to_s)
    # end

    # str_arr.to_i.hash.to_i

  end
end
