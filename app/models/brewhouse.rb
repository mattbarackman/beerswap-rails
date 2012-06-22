class Brewhouse
  include Mongoid::Document
  field :zipcode, type: String
  field :name, type: String
  field :activebeers, type: Integer
end
