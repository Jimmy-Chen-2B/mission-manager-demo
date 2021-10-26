class Mission < ApplicationRecord
  validates :title, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true

  belongs_to :user
end
