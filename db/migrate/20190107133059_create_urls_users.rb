class CreateUrlsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :urls_users do |t|
      t.integer :point, null:false
      t.integer :rank, null:false
      t.references :url, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
