class Mission < ApplicationRecord
  validates :title, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true
end
