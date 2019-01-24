class CreateSecondUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :second_urls do |t|
      t.string :name
      t.string :title
      t.string :author
      t.string :thumbnail
      t.integer :subscriber
      t.integer :view
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
