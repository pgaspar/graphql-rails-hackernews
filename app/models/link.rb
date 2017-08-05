class Link < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :url, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
end
