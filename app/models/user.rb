class User < ActiveRecord::Base
  has_one :coupon
  validates :email, presence: true
end
