class Pin < ApplicationRecord
  belongs_to :user
  has_many :visits, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one_attached :photo
  validates :description, presence: true
  validates :address, presence: true
  validates :title, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
