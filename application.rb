# frozen_string_literal: true

# Entry point to application
class Application
  def call(_env)
    ['200', { 'Content-Type' => 'text/html' }, ['Hello World']]
  end
end
