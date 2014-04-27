class EmbeddedDemo
  include Mongoid::Document
  include Mongoid::DocumentLocker

  field :demo_name

  embedded_in :demo, class_name: 'Demo'
end