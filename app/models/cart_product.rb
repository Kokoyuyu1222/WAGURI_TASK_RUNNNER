class CartProduct < ApplicationRecord
	belongs_to :consumer
	belongs_to :product
end
