class Note < ApplicationRecord
  belongs_to :client
  belongs_to :user

  validates :content, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
