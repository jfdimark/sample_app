# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  #note to self - if I only wanted a password with a min. 
  #one letter, one number and one special character
  #could i use a VALID_PASSWORD_REGEX to require this?
  validates :password_confirmation, presence: true
  #note to self - does this mean the password could be in 
  #different letter case?
  #Would it need a uniqueness: { case_sensitive: true }
  #in order to stop that, or is it default case sensitive?

end