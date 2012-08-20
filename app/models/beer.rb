class Beer
  include Mongoid::Document
  field :beer_style, type: String
  field :beer_abv, type: Float
  field :beer_bascore, type: Integer
  field :beer_name, type: String
  field :brewery_name, type: String
end
