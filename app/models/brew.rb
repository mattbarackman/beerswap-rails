class Brew
  include Mongoid::Document
  field :name, type: String
  field :style, type: String
  field :mash_type, type: String
  field :grains, type: Array
  field :hops, type: Array
  field :extras, type: Array
  field :instructions, type: String
  field :submitted_by, type: String
  field :created_by, type: String
  field :submitted_at, type: DateTime, default: ->{ DateTime.now }
end
