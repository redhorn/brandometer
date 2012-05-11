class Rating < ActiveRecord::Base
  attr_accessible :value, :brand, :user

  belongs_to :brand
  belongs_to :user

  VALID_RATINGS = [RATING_DISLIKE, RATING_INDIFFERENT, RATING_LIKE]

  validates :brand, presence: true
  validates :value, presence: true, inclusion: { in: VALID_RATINGS }

end
