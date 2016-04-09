
require 'pry'

class NumberWrap

  attr_reader :number

  def initialize(n)
    @number = n.to_i
  end

  def |(other)
    self.class.new("#{@number}#{other.number}".to_i)
  end

  def +(other)
    self.class.new(@number + other.number)
  end

  def -(other)
    self.class.new(@number - other.number)
  end

  def %(other)
    if other.is_a?(self.class)
      @number % other.number
    else
      @number % other
    end
  end

end

class NumberGroup
  attr_reader :group

  def initialize(g)
    @group = g.to_s.split("").map{|n| n.respond_to?(:to_i) ? NumberWrap.new(n) : n }
  end

  def [](get)
    @group[get]
  end

  def size()
    @group.size
  end

  def to_a
    @group
  end

  def zip(other)
    @group.zip(other)
  end

end


module Ugly

  def self.numbers(n)
    possibilities(NumberGroup.new(n)).map { |p|
      combine(resolve_combinations(p))
    }.select{|n| [2,3,5,7].select{|x| n % x == 0}.size == 0 }.size
  end

  def self.possibilities(group)
    slots = group.size - 1
    [:-, :+, :|].repeated_permutation(slots).map { |p| group.zip(p).flatten.compact  }
  end

  def self.combine(list)
    return list.pop if list.size == 1
    n = list[0].send(list[1],list[2])
    new_list = list.drop(3)
    new_list.unshift(n)
    self.combine(new_list)
  end

  def self.resolve_combinations(list, new_list=[])
    return new_list + list if !list.include?(:|) || list.empty?
    x = list.take(3)
    if x[1] == :|
      combined = x[0].send(x[1],x[2])
      temp = list.drop(3)
      temp.unshift(combined)
      resolve_combinations(temp, new_list)
    else
      new_list = new_list + list.take(2)
      resolve_combinations(list.drop(2),new_list)
    end
  end

end
