# frozen_string_literal: true

require_relative './base_controller.rb'

# Handles requests pertaining to dogs
class DogsController < BaseController
  # GET /dogs
  def index
    build_response dog_page('this should be a list of dogs')
  end

  # GET /dogs/:id
  def show
    build_response dog_page("this should show dog ##{params[:id]}")
  end

  # GET /dogs/new
  def new
    build_response dog_page('a page to create a new dog')
  end

  # POST /dogs
  # TODO: Not implemented for now
  def create
    redirect_to '/dogs'
  end

  private

  def dog_page(message)
    <<~HTML
      <html>
        <head>
          <title>A Rack Demo</title>
        </head>
        <body>
          <h1>This is DogsController##{params[:action]}</h1>
          <p>#{message}</p>
        </body>
      </html>
    HTML
  end
end
