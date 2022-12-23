# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user_data) do
      { first_name: 'Ян', second_name: 'Баян', password: '123', password_confirmation: '123', email: 'нфт@mail.ru',
        phone: '+79999999999' }
    end
    let!(:user_email_repeat) do
      { first_name: 'Ян', second_name: 'Баян', password: '345', password_confirmation: '345', email: 'user@mail.ru',
        phone: '+78888888888' }
    end
    let!(:user_phone_repeat) do
      { first_name: 'Ян', second_name: 'Баян', password: '345', password_confirmation: '345', email: 'test@mail.ru',
        phone: '+79999999999' }
    end
    let!(:user_main) { User.create(user_data) }
    let!(:user_mail_repeat) { User.new(user_email_repeat) }
    let!(:user_tel_repeat) { User.new(user_phone_repeat) }

    it 'created mail repeated user' do
      expect(user_mail_repeat.valid?).to eq(false)
    end

    it 'created tel repeated user' do
      expect(user_tel_repeat.valid?).to eq(false)
    end

    it { should validate_presence_of(:email).with_message('не может быть пустым') }
    it { should validate_presence_of(:first_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:second_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:phone).with_message('не может быть пустым') }
    it { should validate_presence_of(:password).with_message('не может быть пустым') }

    context 'when email - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:email) }
    end

    context 'when email - valid' do
      it {
        should allow_value("#{Faker::Lorem.word}@#{[*'a'..'z'].shuffle[2..5].join}.#{[*'a'..'z'].shuffle[2..3].join}").for(:email)
      }
    end

    context 'when first name - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:first_name) }
    end

    context 'when first name - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я'].shuffle[2..5].join).for(:first_name) }
    end

    context 'when second name - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:second_name) }
    end

    context 'when second name - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я'].shuffle[2..5].join).for(:second_name) }
    end

    context 'when phone - invalid' do
      it { should_not allow_value(rand(10_000_000_000..99_999_999_999).to_s).for(:phone) }
    end

    context 'when phone - valid' do
      it { should allow_value("+7#{rand(1_000_000_000..9_999_999_999)}").for(:phone) }
    end

    context 'when phone - has not only numbers' do
      it { should_not allow_value(SecureRandom.base64).for(:phone) }
    end
  end
end