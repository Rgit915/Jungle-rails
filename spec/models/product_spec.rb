require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully with all four fields set' do
      category = Category.create(name: 'Flower')
      product = Product.new(
        name: 'Rose flower',
        price: 10.99,
        quantity: 5,
        category: category
      )
      expect(product.save).to be true
    end

  end
end
