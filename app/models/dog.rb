# frozen_string_literal: true

require_relative './base.rb'

# A representation of a beautiful dog
class Dog < Base
  attr_accessor :name

  def initialize(name: nil)
    @name = name
  end
end
