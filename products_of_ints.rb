require 'pry'

module ProductsOfInts

  def self.get_products_of_all_ints_except_at_index(ints)
    new_ar = []
    ints.each_with_index do |x,i|
      v = product(ints, i)
      new_ar[i] = v
    end
    return new_ar
  end

  def self.product(ints, idx_to_ignore)
    idx = 0
    ints.reduce(1) do |product, n|
      idx == idx_to_ignore ? val = product : val = product * n
      idx += 1
      val
    end
  end

end
