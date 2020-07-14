# frozen_string_literal: true

app_files = File.expand_path('app/**/*.rb', __dir__)
Dir.glob(app_files).sort.each { |file| require(file) }

# Entry point to application
class Application
  def call(env)
    request = Rack::Request.new(env)
    serve_request(request)
  end

  private

  def serve_request(request)
    Router.new(request).route!
  end
end
