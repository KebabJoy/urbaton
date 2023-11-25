class AddColumnsToFeeds < ActiveRecord::Migration[7.0]
  def change
    add_column :feeds, :type, :string, null: false
    add_column :feeds, :picture_url, :string
  end
end
