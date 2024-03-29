class Brand < ActiveRecord::Base
  attr_accessible :name, :uid, :active, :collecting, :elo, :wr

  has_many :tag_occurrences
  has_many :tags, through: :tag_occurrences
  has_many :ratings

  before_save :cleanup_name
  before_save :create_uid

  validates :name, presence: true
  validates :uid, uniqueness: true

  scope :battles

  HUMANIZED_ATTRIBUTES = {
    uid: "Unique identifier"
  }

  def to_param
    "#{self.uid.parameterize}"
  end

  def self.human_attribute_name(attribute, options = {})
    HUMANIZED_ATTRIBUTES[attribute.to_sym] || super
  end

  def rating
    return 0 unless ratings.any?
    ((ratings.sum(:value).to_f / ratings.size.to_f) * 100).round / 100.00
  end

  def battles
    Battle.where("loser = ? OR winner = ?", id, id)
  end

  def battles_lost
    Battle.where("loser = ?", id)
  end

  def battles_won
    Battle.where("winner = ?", id)
  end

  private

    def cleanup_name
      self.name = self.name.gsub(/\s\s+/, ' ')
    end

    def create_uid
      self.uid ||= name
      self.uid = self.uid.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/, '').downcase.to_s.gsub(/ /, '_')
    end

end
