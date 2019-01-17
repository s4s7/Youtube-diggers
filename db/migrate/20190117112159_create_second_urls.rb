class CreateSecondUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :second_urls do |t|
      t.string :name, null: false
      t.string :thumbnail, null: false
      t.integer :subscriber, null: false
      t.integer :view, null: false
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
