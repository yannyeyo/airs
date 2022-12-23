# frozen_string_literal: true

# for otzivi
class ReviewsController < ApplicationController
  before_action :autorize, only: :new

  def new
    @comment = Review.new(comm_form_params)
    @comment.user_id = current_user.id
    return unless @comment.valid?

    @comment.save
    flash[:notice] = 'Комментарий оставлен'
  end

  def show
    @comments = Review.all
  end

  private

  def comm_form_params
    params.permit(:body, photos: [])
  end
end