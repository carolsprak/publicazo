class AddTimesToReservationService < ActiveRecord::Migration
  def change
    add_column :reservation_services, :time_start, :datetime
    add_column :reservation_services, :time_end, :datetime
  end
end
