class Hero < ApplicationRecord
  validates :name, :token, presence: true

  scope :by_token, ->(value) { where(token: value) }
  scope :sorted_by_name, -> { order(:name) }
  scope :search, ->(term) { where('LOWER(name) LIKE?', "%#{term.downcase}%") if term.present? }
end
