class CreateTotalPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :total_points do |t|
      t.string :youtube_url, null: false
      t.integer :point, null: false
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
