# frozen_string_literal: true

class Review < ApplicationRecord
    has_many_attached :photos
    belongs_to :user
  
    validates :body, presence: true, length: { minimum: 10 },
    format: { with: /\A[а-яА-Я0-9,.!?:"'\-()\s]*\z/, message: 'Только русские буквы, цифры и спец символы' }
    def comm_thumb(pic)
      pic.variant(resize_to_limit: [300, 300]).processed
    end
  end
  
