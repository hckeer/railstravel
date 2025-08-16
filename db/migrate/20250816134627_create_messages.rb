class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sender_type
      t.integer :sender_id
      t.string :recipient_type
      t.integer :recipient_id

      t.timestamps
    end
  end
end
