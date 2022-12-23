class AirTicket < ApplicationRecord
    has_many :air_records
    has_one_attached :photo
    def mas_thumb(pic)
        pic.variant(resize_to_limit: [300, 300]).processed
    end
end
