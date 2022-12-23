# frozen_string_literal: true

# to see your services and theirs status
class MyAirController < ApplicationController
  before_action :autorize, only: :show
  def show
    @my_air_tickets = AirRecord.where(user_id: current_user)
  end
end
