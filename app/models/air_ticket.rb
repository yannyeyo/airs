class AirTicket < ApplicationRecord
    has_one_attached :photo
    has_many :air_records
    validates :title, presence: true, uniqueness: true, format: { with: /\A[а-яА-Я0-9,.!?:"'\-()\s]*\z/,
        message: 'Только русские буквы, цифры и спец символы' } 
    validates :description, presence: true, length: {minimum: 10}, format: { with: /\A[а-яА-Я0-9,.!?:"'\-()\s]*\z/,
        message: 'Только русские буквы, цифры и спец символы' }
    validates :price, presence: true
    validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 1
    def mas_thumb(pic)
        pic.variant(resize_to_limit: [300, 300]).processed
    end
end
