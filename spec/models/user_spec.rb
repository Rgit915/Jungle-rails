require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with password and password_confirmation fields' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.save).to be true
    end

    it 'should have matching password and password_confirmation' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end

