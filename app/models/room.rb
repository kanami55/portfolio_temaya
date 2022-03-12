class Room < ApplicationRecord
  has_many :entris, dependent: :destroy
  has_many :messages, dependent: :destroy
end
