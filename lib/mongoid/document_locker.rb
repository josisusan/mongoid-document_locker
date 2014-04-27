require "mongoid/document_locker/version"

module Mongoid
  module DocumentLocker
    extend ActiveSupport::Concern

    included do

      field :lock, type: Boolean, default: false

    end
  end
end
