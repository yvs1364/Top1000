class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :pin
  validates :note, inclusion: { in: [0, 1, 2, 3, 4, 5] }, presence: :true
end
