# The Odin Project
# Ruby Programming Track - Project 5
# Enumerables: Recreate the .each generator.

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
    # TODO This doesn't seem to return the same as
    # the internal select method. Why?
    return self.to_enum(:select) unless block_given?

    results = []
    self.my_each do |item|
      if yield(item)
        results << item
      end
    end
    results
  end


  def my_all?
    # TODO Implicitly use { |obj| obj } if no block given
    # How can I do this?
    if block_given?
      self.my_each { |item| return false unless yield(item) }
    else
      self.my_each { |item| return false unless item }
    end
    true
  end

  def my_any?
    # TODO Implicitly use { |obj| obj } if no block given
    # How can I do this?
    if block_given?
      self.my_each { |item| return true if yield(item) }
    else
      self.my_each { |item| return true if item }
    end
    false
  end

  def my_none?
    if block_given?
      self.my_each { |item| return false if yield(item) }
    else
      self.my_each { |item| return false if item }
    end
    true
  end

  def my_count
  end

  def my_map
  end

  def my_inject
  end



  # Method to test my_inject
  def multiply_els(arr)

  end
end
