# frozen_string_literal: true

class Hero < ApplicationRecord
  validates :name, presence: true

  scope :sorted_by_name, -> { order(:name) }
end
