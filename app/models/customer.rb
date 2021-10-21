class Customer < ApplicationRecord

  # Usuarios possui muitos pedidos(orders)
  has_many :orders

  validates :address, presence: true

  def full_name
    "Sr. #{name}"
  end

end
