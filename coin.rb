ALL = []
module Coin

  def self.all_possible(amount, denominations,possibilities=[])
    # I know this problem is solvable by recursion but how?!
        all_possible(amount-d,denominations,possibilities)
  end

end
