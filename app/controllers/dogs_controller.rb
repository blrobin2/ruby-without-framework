# frozen_string_literal: true

require_relative './base_controller.rb'

# Handles requests pertaining to dogs
class DogsController < BaseController
  # GET /dogs
  def index
    @title = 'So many dogs'
    @dogs = DogMapper.all
    build_response render_template
  end

  # GET /dogs/:id
  def show
    puts params
    @dog = params['name'] ? DogMapper.find_by_name(params['name']) : DogMapper.find(params[:id])
    @title = "#{@dog.name}'s page"
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
    dog = Dog.new(name: params['dog']['name'])
    DogMapper.save(dog)
    redirect_to '/dogs'
  end
end
