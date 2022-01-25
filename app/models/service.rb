class Service < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservation_services
  has_many :guest_review_services
  
  #geocoded_by :address
  #after_validation :geocode, if: :address_changed?

  validates :service_category, presence: true
  validates :service_type, presence: true
  validates :service_mode, presence: true
  validates :payment_period, presence: true

  def cover_photo
    if self.photos.length > 0
      self.photos[0].image.url()
    else
      "11.png"
    end
  end

  def average_rating
    guest_review_services.count == 0 ? 0 : guest_review_services.average(:star).round(2).to_i
    
  end
 
end
