require "digest"

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  has_many :missions

  before_create :encrypt_password

  def encrypt_password
    salted_pw = "aovger#{self.password}348950#{self.password}sfj246-540zco"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end
end
