class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :visits
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :address, presence: true
  has_many :pins
  has_many :comments
  has_many :votes
  has_many :visits
end
