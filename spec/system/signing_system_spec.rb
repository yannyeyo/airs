# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'signing record', type: :system do
  let!(:service_data) { { title: 'Тестовая услуга', description: 'Супер описание теста', price: '2000' } }
  let!(:service_main) { AirTicket.create(service_data) }

  scenario 'creating sign' do
    user = User.create(id: '1', first_name: 'Ян', second_name: 'Кур', email: 'yankur@mail.ru', phone: '+71111111211', password: '12345',
                       password_confirmation: '12345')
    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('#log_btn').click

    expect(page).to have_text('Успешный вход')

    find('#signs').click

    find('#ord').click

    find('#sign_id').click
    sleep(1)

    expect(page).to have_text('Ваша заявка оставленна')
  end
end