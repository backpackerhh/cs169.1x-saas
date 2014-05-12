module FunWithStrings
  # A palindrome is a word or phrase that reads the same forwards as backwards,
  # ignoring case, punctuation, and nonword characters. (A "nonword character"
  # is defined for our purposes as "a character that Ruby regular expressions
  # would treat as a nonword character".)

  # Your solution shouldn't use loops or iteration of any kind. Instead, you
  # will find regular-expression syntax very useful; it's reviewed briefly in
  # the book, and the Rubular website lets you try out Ruby regular expressions
  # "live". Some methods that you might find useful (which you'll have to look
  # up in the Ruby documentation) include String#downcase, String#gsub, and
  # String#reverse.

  # The spec file contains a number of test cases. At a minimum, all should pass
  # before you submit your code. We may run additional cases as well.
  def palindrome?
    str = self.downcase.scan(/\w/)
    str == str.reverse
  end

  # Define a function count_words that, given an input string, return a hash
  # whose keys are words in the string and whose values are the number of times
  # each word appears.

  # Your solution shouldn't use for-loops, but iterators like each are permitted.
  # As before, nonwords and case should be ignored. A word is defined as a string
  # of characters between word boundaries.
  def count_words
    counter = Hash.new(0)
    words = self.downcase.scan(/\w+/)
    words.each { |word| counter[word] += 1 }
    counter
  end

  # An anagram group is a group of words such that any one can be converted
  # into any other just by rearranging the letters. For example, "rats", "tars"
  # and "star" are an anagram group.

  # Given an array of strings, write a method that groups them into anagram
  # groups and returns the array of groups. Case doesn't matter in classifying
  # string as anagrams (but case should be preserved in the output), and the
  # order of the anagrams in the groups doesn't matter.
  def anagram_groups
    words = self.scan(/\w+/)
    words.group_by { |word| word.downcase.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:
class String
  include FunWithStrings
end
