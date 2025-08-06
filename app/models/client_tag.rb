class ClientTag < ApplicationRecord
  belongs_to :client
  belongs_to :tag

  validates :client_id, uniqueness: { scope: :tag_id }
end
