class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :name, null:false
      t.string :thumbnail, null:false
      t.integer :subscriber, null:false
      t.integer :view, null:false
      t.timestamps
    end
  end
end
