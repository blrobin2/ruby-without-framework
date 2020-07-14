# frozen_string_literal: true

# A representation of a beautiful dog
class Dog
  attr_accessor :id, :name

  def initialize(id: nil, name: nil)
    @id = id
    @name = name
  end
end
