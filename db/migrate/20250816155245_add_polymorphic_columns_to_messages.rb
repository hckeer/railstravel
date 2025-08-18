# db/migrate/[timestamp]_add_polymorphic_columns_to_messages.rb
class AddPolymorphicColumnsToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :user_type, :string
    add_index :messages, [:user_type, :user_id]
    
    # Remove the old reference if it exists
    remove_column :messages, :client_id, :integer if column_exists?(:messages, :client_id)
  end
end