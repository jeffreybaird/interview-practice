def get_max_profit(stock_prices_yesterday)
  puts MaxStockPrice.get_max_profit(stock_prices_yesterday)
end

module MaxStockPrice
  stock_prices_yesterday = [1,2,3,4,5]

  def self.get_max_profit(stock_prices_yesterday)
    min = get_index_of_cheapest_price(stock_prices_yesterday)
    max = get_index_of_most_expensive_price(stock_prices_yesterday)
    if max > min
      stock_prices_yesterday[max] - stock_prices_yesterday[min]
    elsif max == 0 && min == stock_prices_yesterday.size - 1
      brute_force(stock_prices_yesterday)
    elsif max < min
      index_poss1 = find_smallest_to_left(stock_prices_yesterday, max)
      index_poss2 = find_largest_to_right(stock_prices_yesterday, min)
      poss1 = stock_prices_yesterday[max] - stock_prices_yesterday[index_poss1] if index_poss1
      poss2 = stock_prices_yesterday[index_poss2] - stock_prices_yesterday[min] if index_poss2
      [poss1,poss2].compact.max
    elsif max == min
      0
    else
      raise StandardError, "something is wrong"
    end
  end

  def self.brute_force(stock_prices_yesterday)
    all_indexes(stock_prices_yesterday).map do |n|
      stock_prices_yesterday[n[0]] - stock_prices_yesterday[n[1]]
    end.max
  end

  def self.find_smallest_to_left(stock_prices_yesterday, max)
    return nil if max == 0
    stock_prices_yesterday.index(stock_prices_yesterday[0..max].min)
  end

  def self.find_largest_to_right(stock_prices_yesterday, min)
    return nil if min == stock_prices_yesterday.size - 1
    stock_prices_yesterday.index(stock_prices_yesterday[min..-1].max)
  end

  def self.get_index_of_cheapest_price(stock_prices_yesterday)
    stock_prices_yesterday.index(stock_prices_yesterday.min)
  end

  def self.get_index_of_most_expensive_price(stock_prices_yesterday)
    stock_prices_yesterday.index(stock_prices_yesterday.max)
  end

  def self.all_indexes(stock_prices_yesterday)
    x = stock_prices_yesterday.size
    x.times.flat_map{|y| x.times.map{|i| [y,i] if y > i }}.compact
  end


end
