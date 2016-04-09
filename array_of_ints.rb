module ArrayOfInts

  def self.product_of_three(ints)
    if ints.size == 3
      ints.reduce(:*)
    else
      ints.permutation(3).map { |e| product_of_three(e) }.max
    end
  end

end
