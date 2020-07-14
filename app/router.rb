# frozen_string_literal: true

# Defines a mapping of request patterns to corresponding responses
class Router
  def initialize(request)
    @request = request
  end

  def route!
    if @request.path == '/'
      [200, { 'Content-Type' => 'text/plain' }, ['Hello World']]
    else
      not_found
    end
  end

  private

  def not_found(msg = 'Not Found')
    [404, { 'Content-Type' => 'text/plain' }, [msg]]
  end
end
