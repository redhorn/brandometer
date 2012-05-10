class Tag < ActiveRecord::Base
  attr_accessible :value

  has_many :tag_occurrences
  has_many :brands, through: :tag_occurrences

end
