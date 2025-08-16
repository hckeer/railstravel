class CreateApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :applications do |t|
      t.references :post, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
