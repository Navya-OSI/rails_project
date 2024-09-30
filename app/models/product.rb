class Product < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_one :profile, through: :user
end
