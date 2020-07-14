class AddModeToService < ActiveRecord::Migration
  def change
    add_column :services, :service_mode, :string
  end
end
