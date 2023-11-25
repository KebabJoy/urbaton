class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.string :status, default: :pending
      t.belongs_to :author, null: false
      t.belongs_to :manager

      t.timestamps
    end
  end
end
