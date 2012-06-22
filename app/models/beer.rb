class Beer
  include Mongoid::Document
  field :style, type: String
  field :abv, type: String
  field :bascore, type: Integer
  field :name, type: String
end
