class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :name
      t.string :thumbnail
      t.integer :subscriber
      t.integer :view
      t.timestamps
    end
  end
end
