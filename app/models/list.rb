class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  # has_many :movies
  validates :name, uniqueness: true, presence: true
end
