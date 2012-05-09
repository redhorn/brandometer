class Brand < ActiveRecord::Base
  attr_accessible :name, :uid, :active, :collecting, :elo, :wr

  before_save :cleanup_name
  before_save :create_uid

  validates :name, presence: true

  def to_param
    "#{self.uid.parameterize}"
  end

  private

    def cleanup_name
      self.name = self.name.gsub(/\s\s+/, ' ')
    end

    def create_uid
      self.uid = name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/, '').downcase.to_s
      self.uid = self.uid.gsub(/ /, '_')
    end

end
