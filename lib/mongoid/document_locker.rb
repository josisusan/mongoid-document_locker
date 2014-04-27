require "mongoid/document_locker/version"

module Mongoid
  module DocumentLocker
    extend ActiveSupport::Concern

    included do

      field :lock, type: Boolean, default: false

    end

    def lock!
      self.collection.find(atomic_selector).
          update({"$set" => { "lock" => true }})
      true
    end
  end
end
