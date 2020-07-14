# frozen_string_literal: true

require 'yaml/store'

# Handles mapping columns to persistence
class BaseMapper
  DB_FILE = File.expand_path('../../db.yml', __dir__)

  # Methods available to class
  module ClassMethods
    def find(id)
      db.transaction(true) do
        db[derive_db_id(name, id)]
      end
    end

    def all
      db.transaction(true) do
        ids = extract_model_ids(db)
        ids.map { |key| db[key] }
      end
    end

    def save(object)
      ensure_presence_of_id(object)
      db_id = derive_db_id(object.class.name, object.id)
      db.transaction do
        db[db_id] = object
      end
    end

    def next_available_id
      last_id = all_ids.map do |key|
        key.sub("#{model_name}_", '').to_i
      end.max.to_i

      last_id + 1
    end

    def ensure_presence_of_id(object)
      object.id ||= next_available_id
    end

    private

    def db
      @db ||= YAML::Store.new(DB_FILE)
    end

    def model_name(mapper_name = name)
      mapper_name.sub('Mapper', '')
    end

    def derive_db_id(mapper_name, object_id)
      "#{model_name(mapper_name)}_#{object_id}"
    end

    def all_ids
      db.transaction(true) do |db|
        extract_model_ids(db)
      end
    end

    def extract_model_ids(store)
      store.roots.select do |key|
        key.start_with?(model_name)
      end
    end
  end

  extend ClassMethods
end
