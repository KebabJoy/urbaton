class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :middle_name, :string
    add_column :users, :phone, :string
    add_column :users, :district, :string
  end
end
