class Demo
  include Mongoid::Document

  field :name

  validates_presence_of :name
  embeds_one :embed_demo ,class_name: 'EmbeddedDemo'
end