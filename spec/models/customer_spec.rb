require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  # FIXTURES -> EXEMPLO
  # fixtures :customers # all -> carrega todos os arquivos
  # it 'Create a Customer' do
  #   customer = customers(:ricardo)    
  #   expect(customer.full_name).to eq("Sr. Ricardo Kumagae")
  # end

  # FACTORY_BOT
  # it 'Create a Customer' do
  #   customer = create(:customer)
  #   expect(customer.full_name).to eq("Sr. Ricardo Kumagae")
  # end

  # FAKER
  # it '#full_name' do
  #   customer = create(:customer)
  #   expect(customer.full_name).to start_with("Sr. ")
  # end

  # FAKER -> SOBRESCREVENDO
  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:customer, name: "Ricardo Kumagae")
    customer1 = create(:customer, name: "Ricardo Kumagae")
    # customer = build(:customer, name: "Ricardo Kumagae")
    puts customer.email
    puts customer1.email
    expect(customer.full_name).to start_with("Sr. ")
  end

  it '#vip - HERANÇA' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false) # be_falsey
  end

  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  # ATTRIBUTES_FOR -> EXEMPLO
  # it 'Usando o attributes_for' do
  #   attrs = attributes_for(:customer)
  #   attrs1 = attributes_for(:customer_vip)
  #   attrs2 = attributes_for(:customer_default)
  #   puts attrs
  #   puts attrs1
  #   puts attrs2
  # end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Atributo TRANSITÓRIO' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end 
  
  it 'Cliente FEMININO VIP' do
    customer = create(:customer_female_vip)
    expect(customer.vip).to eq(true)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente FEMININO DEFAULT' do
    customer = create(:customer_female_default)
    # expect(customer.default).to eq(true)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente MASCULINO VIP' do
    customer = create(:customer_male_vip)
    expect(customer.vip).to eq(true)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente MASCULINO' do
    customer = create(:customer_male)
    #expect(customer.vip).to eq(true)
    expect(customer.gender).to eq('M')
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end
    puts @customer.created_at
    puts Time.now
    expect(@customer.created_at).to eq( Time.new(2004, 11, 24, 01, 04, 44) )
    expect(@customer.created_at).to be < Time.now
  end
  
  

  it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }  
  
end
