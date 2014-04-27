$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

MODELS = File.join(File.dirname(__FILE__), "app/models")
$:.unshift(MODELS)

require "mongoid"
require "rspec"

require "mongoid/document_locker"


ENV["MONGOID_SPEC_HOST"] ||= "localhost"
ENV["MONGOID_SPEC_PORT"] ||= "27017"

# Set the database that the spec suite connects to.
Mongoid.configure do |config|
  config.connect_to("mongoid_test")
end

# Autoload every model for the test suite that sits in spec/app/models.
Dir[ File.join(MODELS, "*.rb") ].sort.each do |file|
  name = File.basename(file, ".rb")
  autoload name.camelize.to_sym, name
end

RSpec.configure do |config|

  # Drop all collections before each spec.
  config.before(:each) do
    Mongoid.purge!
  end

end
