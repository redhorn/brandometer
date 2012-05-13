class Battle < ActiveRecord::Base
  attr_accessible :loser, :winner, :user

  belongs_to :user

  validates :loser, presence: true
  validates :winner, presence: true
end
