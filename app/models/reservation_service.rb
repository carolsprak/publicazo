class ReservationService < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
end
