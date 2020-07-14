class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_category
      t.string :service_type
      t.string :payment_period
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_independent
      t.boolean :is_legal_person
      t.boolean :has_invoice
      t.boolean :has_garantee
      t.float :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
