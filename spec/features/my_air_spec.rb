# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'my_air', type: :feature do
  scenario 'invalid' do
    visit 'my_air/show'

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end