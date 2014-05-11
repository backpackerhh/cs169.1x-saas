# Define a method sum which takes an array of integers as an argument and
# returns the sum of its elements. For an empty array it should return zero.
def sum(array)
  return 0 if array.empty?
  return array.first if array.length == 1

  array.inject(:+)
end

# Define a method max_2_sum which takes an array of integers as an argument and
# returns the sum of its two largest elements. For an empty array it should return
# zero. For an array with just one element, it should return that element.
def max_2_sum(array)
  sum array.sort.last(2)
end

# Define a method sum_to_n? which takes an array of integers and an additional
# integer, n, as arguments and returns true if any two distinct elements in the
# array of integers sum to n. An empty array or single element array should both
# return false.
def sum_to_n?(array, n)
  return false if array.empty? || array.length == 1

  array.combination(2).any? { |x, y| x + y == n }
end
