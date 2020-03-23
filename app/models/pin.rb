class Pin < ApplicationRecord
  belongs_to :user
  has_many :visits, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one_attached :photo
  validates :description, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true
  validates :address, presence: true, if: :distance?
  reverse_geocoded_by :latitude, :longitude

  def distance?
    t = self.distance_from([self.user.position_latitude, self.user.position_longitude])
    if t >= 0.25
      errors.add(:address, "WASTED ! Your too far!")
    end
  end
end
