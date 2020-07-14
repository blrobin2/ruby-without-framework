# frozen_string_literal: true

require_relative './application.rb'

use Rack::Reloader, 0
run Application.new
