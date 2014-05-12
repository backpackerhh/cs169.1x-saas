# Define a method attr_accessor_with_history that provides the same functionality
# as attr accessor but also tracks every value the attribute has ever had.

# History of instance variables should be maintained separately for each object
# instance.

# HINTS:
# * Don't forget that the very first time the attribute receives a value, its 
# history array will have to be initialized.
# * An attribute's initial value is always nil by default, so if foo_history 
# is referenced before foo has ever been assigned, the correct answer is nil, 
# but after the first assignment to foo, the correct value for foo_history would 
# be [nil].
# * Don't forget that instance variables are referred to as @bar within getters 
# and setters.
# * Although the existing attr_accessor can handle multiple arguments (e.g. 
# attr_accessor :foo, :bar), your version just needs to handle a single argument.
# * Your implementation should be general enough to work in the context of any class
# and for attributes of any (legal) variable name
# * Note that one powerful metaprogramming feature in Ruby is class_eval that can 
# be called in the meta-class Class. class_eval can interpret a string on the fly to 
# create some new code.
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s         # make sure it's a string

    attr_reader attr_name              # create the attribute's getter
    attr_reader attr_name + '_history' # create bar_history getter

    class_eval %Q{
      def #{attr_name}=(value)
        @#{attr_name}_history = [] unless defined?(@#{attr_name}_history)
        @#{attr_name}_history << @#{attr_name}
        @#{attr_name} = value
      end
    }
  end
end
