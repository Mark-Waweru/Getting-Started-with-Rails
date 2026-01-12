class Subscriber < ApplicationRecord
  belongs_to :product
  generate_token_for :unsubscribe
end
