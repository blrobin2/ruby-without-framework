# frozen_string_literal: true

require_relative './base_controller.rb'

# Handles requests pertaining to dogs
class DogsController < BaseController
  # GET /dogs
  def index
    @title = 'So many dogs'
    @dogs = (1..5).map do |i|
      OpenStruct.new(id: i, name: "Dog-#{i}")
    end
    build_response render_template
  end

  # GET /dogs/:id
  def show
    dog_name = "Dog-#{params[:id]}"
    @title = "#{dog_name}'s page"
    @dog = OpenStruct.new(id: params[:id], name: dog_name)
    build_response render_template
  end

  # GET /dogs/new
  def new
    @title = 'More dogs please'
    build_response render_template
  end

  # POST /dogs
  # TODO: Not implemented for now
  def create
    redirect_to '/dogs'
  end
end
