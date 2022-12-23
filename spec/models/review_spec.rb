# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body).with_message('не может быть пустым') }

    context 'when body - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:body) }
    end

    context 'when body is short' do
      it { should_not allow_value([*'А'..'Я', *'а'..'я'].shuffle[1..9].join).for(:body) }
    end

    context 'when body is normal length but invalid letters' do
      it { should_not allow_value(SecureRandom.alphanumeric(15)).for(:body) }
    end

    context 'when body - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:body) }
    end
  end
end