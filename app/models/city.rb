class City < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { minimum: 10 }
  validates :about, presence: true
  validates :city_name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  
  def countPlace
    @places = Place.all
    c = 0
    @places.each do |place|
      if self.city_name == place.city
        c+=1
      else
        c=c
      end
    end
    return c
  end
  
end
