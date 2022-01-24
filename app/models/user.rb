class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}

  has_many :services
  has_many :reservation_services

  has_many :guest_review_services, class_name: "GuestReviewService", foreign_key: "guest_id"
  has_many :host_review_services, class_name: "HostReviewService", foreign_key: "host_id"


  def self.from_omniauth(auth)
  	  	user = User.where(email: auth.info.email).first

  	  	if user
  	  		return user
  	  	else
		  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		    user.email = auth.info.email
		    user.password = Devise.friendly_token[0,20]
		    user.fullname = auth.info.name   
		    user.image = auth.info.image
		    user.uid = auth.uid
		    #user.provider = auth.provider
		    # If you are using confirmable and the provider(s) you use validate emails, 
		    # uncomment the line below to skip the confirmation emails.
		    user.skip_confirmation!
		  end
	    end
  end

end
