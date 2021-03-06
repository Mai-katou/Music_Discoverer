class Evaluation < ApplicationRecord
  belongs_to :user

  validates :music_title, presence: true, length: {maximum:40}
  validates :point, presence: true, numericality: {greater_than_or_equal_to:10, less_than_or_equal_to:1}
  validates :evaluation, presence: true, length: {maximum:500}
end
