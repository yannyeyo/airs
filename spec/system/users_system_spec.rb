# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users', type: :system do
  scenario 'creating user' do
    visit new_user_path

    fill_in 'email', with: 'yarub@mail.ru'
    fill_in 'first_name', with: 'Игорь'
    fill_in 'second_name', with: 'Ярубов'
    fill_in 'phone', with: '+71111111141'
    find_field('pass').set('12345')
    find_field('pass_conf').set('12345')

    find('#btn').click

    expect(page).to have_text('На почту выслано письмо, подтвердите, пожалуйста')
  end

  scenario 'update user' do
    user = User.create(id: '1', first_name: 'Игорь', second_name: 'Ярубов', email: 'yarub@mail.ru', phone: '+71111111113', password: '12345',
                       password_confirmation: '12345', email_confirmed: 'true')

    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    find('#log_btn').click

    visit 'users/1/edit'

    fill_in 'email', with: user.email
    find_field('passw').set('98765')
    find_field('passw_conf').set('98765')
    fill_in 'number', with: '+79121231212'
    find_field('passw_old').set(user.password)

    find('#btn_up_user').click

    expect(page).to have_text('Профиль обновлен')
  end
end
