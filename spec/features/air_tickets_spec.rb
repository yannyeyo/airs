# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'air_tickets', type: :feature do
  scenario 'invalid' do
    visit service_path

    find('#ord').click

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end