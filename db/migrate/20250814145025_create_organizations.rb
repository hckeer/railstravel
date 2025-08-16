class CreateOrganizations < ActiveRecord::Migration[7.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :pan_card_number
      t.string :citizenship

      t.timestamps
    end
  end
end
