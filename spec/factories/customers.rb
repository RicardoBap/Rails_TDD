# SEM FAKER -> EXEMPPLO
# FactoryBot.define do
#   factory :customer do
#     name { "Ricardo Kumagae" }
#     email { "ric_bap@hotmail.com" }
#   end
# end

# FAKER -> EXEMPLO
# FactoryBot.define do
#   factory :customer do
#     name { Faker::Name.name }
#     email { Faker::Internet.email }
#   end
# end

# EXEMPLO
# FactoryBot.define do
#   factory :customer do
#     name { Faker::Name.name }
#     email { Faker::Internet.email }

#     factory :customer_vip do
#       vip { true }
#       days_to_pay { 30 }
#     end

#     factory :customer_default do
#       vip { false }
#       days_to_pay { 15 }
#     end
    
#   end
# end

# TRANSIENT -> EXEMPLO
# FactoryBot.define do
#   factory :customer do

#     transient do
#       upcased { false }
#     end

#     name { Faker::Name.name }
#     email { Faker::Internet.email }

#     factory :customer_vip do
#       vip { true }
#       days_to_pay { 30 }
#     end

#     factory :customer_default do
#       vip { false }
#       days_to_pay { 15 }
#     end

#     after(:create) do |customer, evaluator|
#       customer.name.upcase! if evaluator.upcased
#     end
    
#   end
# end

# EXEMPLO
FactoryBot.define do
  factory :customer do

    transient do
      upcased { false }
      qtt_orders { 3 }
    end

    name { Faker::Name.name }
    #email { Faker::Internet.email }
    sequence(:email, '10') { |n| "meu_email-#{n}@email.com" }
    address { Faker::Address.street_address }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end

    factory :customer_with_orders, traits: [:with_orders]
    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_male_default, traits: [:male, :default]
    factory :customer_female_default, traits: [:female, :default]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
    
  end
end