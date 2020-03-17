class Pin < ApplicationRecord
  belongs_to :user
  has_many :visits
  has_many :comments
  has_many :votes
  has_one_attached :photo
  validates :description, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
