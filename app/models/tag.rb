class Tag < ApplicationRecord
  belongs_to :user
  has_many :client_tags, dependent: :destroy
  has_many :clients, through: :client_tags

  validates :name, presence: true
  validates :color, presence: true

  scope :ordered, -> { order(:name) }
end
