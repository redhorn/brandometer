class TagOccurrence < ActiveRecord::Base
  attr_accessible :brand, :tag, :user

  belongs_to :brand
  belongs_to :tag
  belongs_to :user
end
