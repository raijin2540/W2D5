class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash

    accum = 0
    self.each_with_index do |el, idx|
      accum = (el.hash + idx.hash) ^ accum.hash
    end
    accum
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
    self.to_a.sort_by(&:hash).hash
  end
end
