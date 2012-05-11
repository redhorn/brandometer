class TagOccurrence < ActiveRecord::Base
  attr_accessible :tag, :brand, :user

  belongs_to :brand
  belongs_to :tag
  belongs_to :user
end
