# The Odin Project
# Ruby Programming Track - Project 5
# Enumerables: Recreate some Enumerables.

module Enumerable
  def my_each
    return self unless block_given?

    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    return self unless block_given?

    for i in 0...length
      # print "idx #{i}, val #{self[i]} | "
      yield(self[i], i)
    end
    self
  end

  def my_select
    # TODO: This line doesn't seem to return the same as
    # the internal select method. Why?
    return to_enum(:select) unless block_given?

    results = []
    my_each { |item| results << item if yield(item) }
    results
  end
  alias :my_find_all :my_select

  def my_all?
    # TODO: Implicitly use { |obj| obj } if no block given
    # How can I do this?
    if block_given?
      my_each { |item| return false unless yield(item) }
    else
      my_each { |item| return false unless item }
    end
    true
  end

  def my_any?
    # TODO: Implicitly use { |obj| obj } if no block given
    # How can I do this?
    if block_given?
      my_each { |item| return true if yield(item) }
    else
      my_each { |item| return true if item }
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |item| return false if yield(item) }
    else
      my_each { |item| return false if item }
    end
    true
  end

  def my_count(arg = nil)
    # TODO: is there a better way to handle 0 or 1 arguments?
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif arg
      my_each { |item| count += 1 if item == arg }
    else
      count = length
    end
    count
  end

  def my_map(proc = nil)
    result = []
    if proc && block_given?
      result = proc.call
    elsif block_given?
      my_each { |item| result << yield(item) }
    else
      # TODO: Same issue as with the my_select method.
      # This doesn't return the same thing as the builtin map method.
      result = enum_for(:map)
    end
    result
  end
  alias my_collect my_map

  def my_inject(accumulator = nil, operation = nil, &block)
    if accumulator.nil? && operation.nil? && block.nil?
      raise ArgumentError, "you must provide an operation or a block"
    end

    if operation && block
      raise ArgumentError, "you must provide either an operation symbol or a block, not both"
    end

    if operation.nil? && block.nil?
      operation = accumulator
      accumulator = nil
    end

    block = case operation
            when Symbol
              lambda { |acc, value| acc.send(operation, value) }
            when nil
              block
            else
              raise ArgumentError, "the operation provided must be a symbol"
            end

    if accumulator.nil?
      ignore_first = true
      accumulator = first
    end

    index = 0

    my_each do |element|
      unless ignore_first && index == 0
        accumulator = block.call(accumulator, element)
      end
      index += 1
    end
    accumulator
  end

  alias my_reduce my_inject
end

# Method to test my_inject
def multiply_els(arr)
  product = 1
  arr.each { |el| product * el }
  product
end
