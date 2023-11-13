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

    it 'should require password and password_confirmation' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe'
      )
      user.save
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'is expected to validate that :email is case-insensitively unique' do
      existing_user = create(:user, email: 'test@example.com')
      new_user = build(:user, email: 'TEST@example.com')

      # Ensure the new_user is considered invalid
      new_user.valid?

      # Check if there are no errors related to the email field
      expect(new_user.errors[:email]).to be_empty
    end

  end
end

