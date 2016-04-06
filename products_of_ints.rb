require 'debugger'

module ProductsOfInts

  def self.get_products_of_all_ints_except_at_index(ints)
    new_ar = []
    ints.each_with_index do |x,i|
      new_ar[i] = product(ints, i)
    end
    return new_ar
  end

  def self.product(ints, idx_to_ignore)
    idx = 0
    ints.reduce(1) do |product, n|
      idx == idx_to_ignore ? product : product * n
      idx += 1
    end
  end

end
