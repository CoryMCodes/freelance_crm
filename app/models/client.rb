class Client < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  has_many :client_tags, dependent: :destroy
  has_many :tags, through: :client_tags

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :ordered, -> { order(created_at: :desc) }
end
