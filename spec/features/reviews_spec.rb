# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews', type: :feature do
  scenario 'invalid' do
    visit comm_path

    fill_in :body, with: '123'

    find('#rev_btn').click

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end