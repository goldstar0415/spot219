class Place < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :about, presence: true, length: { minimum: 10, maximum: 500 }
  validates :country, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  
end
