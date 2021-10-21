require 'rails_helper'

RSpec.describe Order, type: :model do
  
  it 'belongs_to' do
    # customer = create(:customer)
    # order = create(:order, customer: customer)

    #puts order.description
    #puts order.customer
    #puts order.customer.name
    
    order = create(:order)    
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos - create_list' do
    orders = create_list(:order, 3) # build_list
    expect(orders.count).to eq(3)

    # METODOS EXTRAS
    # orders = create_pair(:order)
    # expect(orders.count).to eq(2)
  end

  it 'has_many' do
    customer = create(:customer_with_orders, qtt_orders: 5)
    #puts customer.inspect
    #puts customer.orders.inspect
    expect(customer.orders.count).to eq(5)
  end 
  
  
end
