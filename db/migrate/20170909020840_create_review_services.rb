class CreateReviewServices < ActiveRecord::Migration
  def change
    create_table :review_services do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :service, index: true, foreign_key: true
      t.references :reservation_service, index: true, foreign_key: true
      t.references :guest, index: true, foreign_key: true
      t.references :host, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
