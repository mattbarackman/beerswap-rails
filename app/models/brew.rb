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
  

  ## belongs to user
  belongs_to :user


  BREW_STYLES = ["American Amber Ale",    
                  "American Barleywine",
                  "American Brown Ale",
                  "American IPA",
                  "American Pale Ale",
                  "American Stout",
                  "American Wheat or Rye Beer",
                  "Baltic Porter",
                  "Belgian Blond Ale",
                  "Belgian Dark Strong Ale",
                  "Belgian Dubbel",
                  "Belgian Golden Strong Ale",
                  "Belgian Pale Ale",
                  "Belgian Specialty Ale",
                  "Belgian Tripel",
                  "Berliner Weisse",
                  "Biere de Garde",
                  "Blonde Ale",
                  "Bohemian Pilsener",
                  "Brown Porter",
                  "California Common Beer",
                  "Christmas/Winter Specialty Spiced Beer",
                  "Classic American Pilsner",
                  "Classic Rauchbier",
                  "Cream Ale",
                  "Dark American Lager",
                  "Doppelbock",
                  "Dortmunder Export",
                  "Dry Stout",
                  "Dunkelweizen",
                  "Dusseldorf Altbier",
                  "Eisbock",
                  "English Barleywine",
                  "English IPA",
                  "Extra Special/Strong Bitter (English Pale Ale)",
                  "Flanders Brown Ale/Oud Bruin",
                  "Flanders Red Ale",
                  "Foreign Extra Stout",
                  "Fruit Beer",
                  "Fruit Lambic",
                  "German Pilsner (Pils)",
                  "Gueuze",
                  "Imperial IPA",
                  "Irish Red Ale",
                  "Kolsch",
                  "Lite American Lager",
                  "Maibock/Helles Bock",
                  "Mild",
                  "Munich Dunkel",
                  "Munich Helles",
                  "Northern English Brown Ale",
                  "Northern German Altbier",
                  "Oatmeal Stout",
                  "Oktoberfest/Marzen",
                  "Old Ale",
                  "Other Smoked Beer",
                  "Premium American Lager",
                  "Robust Porter",
                  "Roggenbier (German Rye Beer)",
                  "Russian Imperial Stout",
                  "Saison",
                  "Schwarzbier (Black Beer)",
                  "Scottish Export 80/-",
                  "Scottish Heavy 70/-",
                  "Scottish Light 60/-",
                  "Southern English Brown",
                  "Special/Best/Premium Bitter",
                  "Specialty Beer",
                  "Spice, Herb, or Vegetable Beer",
                  "Standard American Lager",
                  "Standard/Ordinary Bitter",
                  "Straight (Unblended) Lambic",
                  "Strong Scotch Ale",
                  "Sweet Stout",
                  "Traditional Bock",
                  "Vienna Lager",
                  "Weizen/Weissbier",
                  "Weizenbock",
                  "Witbier",
                  "Wood-Aged Beer"]

  MASH_TYPES = ["Extract",    
                "Partial Mash",
                "All-Grain"]
end
