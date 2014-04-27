class EmbeddedDemo
  include Mongoid::Document

  field :demo_name

  embedded_in :demo, class_name: 'Demo'
end