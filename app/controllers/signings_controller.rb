# frozen_string_literal: true

# to order service
class SigningsController < ApplicationController
  before_action :autorize, only: %i[sign create_sign]

  def airs
    @air_tickets = AirTicket.order(:title)
  end

  def sign; end

  def create_sign
    @record = AirRecord.new(sign_form_params)
    @record.user_id = current_user.id
    return unless @record.valid?

    @record.save
    flash[:notice] = 'Ваша заявка оставленна'
  end

  private

  def sign_form_params
    params.permit(:trouble, :row1, :place, :date, :air_ticket_id)
  end
end