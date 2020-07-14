# frozen_string_literal: true

run(proc { |_env| ['200', { 'Content-Type' => 'text/html' }, ['Hello World']] })
