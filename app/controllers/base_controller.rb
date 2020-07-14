# frozen_string_literal: true

require 'erb'

# A convience class for handling responses to requests passed into controllers
class BaseController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    build_response render_template
  end

  private

  def build_response(body, status: 200)
    [status, { 'Content-Type' => 'text/html' }, [body]]
  end

  def render_template(name = params[:action])
    templates_dir = self.class.name.downcase.sub('controller', '')
    template_file = File.join(templates_dir, "#{name}.html.erb")

    file_path = template_file_path_for(template_file)

    if File.exist?(file_path)
      puts "Rendering template file #{template_file}"
      render_erb_file(file_path)
    else
      "ERROR: no available template file #{template_file}"
    end
  end

  def render_partial(template_name)
    file_path = template_file_path_for("partials/_#{template_name}.html.erb")
    if File.exist?(file_path)
      puts " > Rendering partial file #{template_name}"
      render_erb_file(file_path)
    else
      "ERROR: no available partial file #{file_path}"
    end
  end

  def template_file_path_for(file_name)
    File.expand_path(File.join('../../templates', file_name), __FILE__)
  end

  def render_erb_file(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

  def redirect_to(uri)
    [302, { 'Location' => uri } []]
  end

  def params
    request.params
  end
end
