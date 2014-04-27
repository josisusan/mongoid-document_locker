require "mongoid/document_locker/version"

module Mongoid
  module DocumentLocker
    extend ActiveSupport::Concern

    included do

      field :lock, type: Boolean, default: false

    end

    def lock!
      selected_collection.find(atomic_selector).
        update({"$set" => { selected_field => true }})
      true
    end
    def selected_collection
      embedded? ? _root.collection : self.collection
    end

    def selected_field
      embedded? ? "#{atomic_position}.lock" : "lock"
    end
  end
end
