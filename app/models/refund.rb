class Refund < ApplicationRecord
  belongs_to :customer
  belongs_to :booking
end
