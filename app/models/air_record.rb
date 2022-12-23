# frozen_string_literal: true

class AirRecord < ApplicationRecord
    belongs_to :user
    belongs_to :air_ticket
    validates :date, :user_id, :row1, :place, presence: true
    enum status: %i[prepared ready]
  end