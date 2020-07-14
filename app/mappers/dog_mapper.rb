# frozen_string_literal: true

require_relative './base_mapper.rb'

# Maps dog records to Dog instances
class DogMapper < BaseMapper
  def self.find_by_name(dog_name)
    all.find { |dog| dog.name == dog_name }
  end
end
