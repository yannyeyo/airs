# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users', type: :feature do
  scenario 'invalid edit' do
    visit 'users/:id/edit'
    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end