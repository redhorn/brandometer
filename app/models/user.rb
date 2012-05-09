class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :dateofbirth, :gender, :zipcode
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  #before_validation { |user| user.zipcode = user.zipcode.gsub(/ /,'') unless user.zipcode.nil? }
  #after_validation { |user| user.zipcode = user.zipcode.to_s.insert(3, ' ') if user.zipcode.length == 5 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_GENDERS = [1, 2]

  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create;
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :gender, inclusion: { in: VALID_GENDERS }, allow_blank: true
  validates :zipcode, numericality: true, length: { is: 5 }, allow_blank: true

  def admin?
    auth_level == AUTH_LEVEL_ADMIN
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
