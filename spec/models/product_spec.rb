require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it 'is valid with description, price and category' do
    product = FactoryBot.create(:product)
    expect(product).to be_valid
  end

  # it 'is invalid without description' do
  #   product = FactoryBot.build(:product, description: nil)
  #   product.valid?
  #   expect(product.errors[:description]).to include("can't be blank")
  # end
  #it { should validate_presence_of(:description) } # SHOULDA-MATCHERS
  #it { is_expected.to validate_presence_of(:description) } # SHOULDA-MATCHERS


  # it 'is invalid without price' do
  #   product = FactoryBot.build(:product, price: nil)
  #   product.valid?
  #   expect(product.errors[:price]).to include("can't be blank")
  # end
  #it { should validate_presence_of(:price) } # SHOULDA-MATCHERS
  #it { is_expected.to validate_presence_of(:price) } # SHOULDA-MATCHERS


  # it 'is invalid without category' do
  #   product = FactoryBot.build(:product, category: nil)
  #   product.valid?
  #   expect(product.errors[:category]).to include("can't be blank")
  # end
  #it { should validate_presence_of(:category) } # SHOULDA-MATCHERS
  #it { is_expected.to validate_presence_of(:category) } # SHOULDA-MATCHERS
  

  context 'Validations' do
    it { is_expected.to validate_presence_of(:description) } # SHOULDA-MATCHERS
    it { is_expected.to validate_presence_of(:price) } # SHOULDA-MATCHERS 
    it { is_expected.to validate_presence_of(:category) } # SHOULDA-MATCHERS
  end

  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'Instance Methods' do
    it '#full_description' do
      product = FactoryBot.create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end 
  end
    
end
