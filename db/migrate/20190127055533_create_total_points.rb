class CreateTotalPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :total_points do |t|

      t.timestamps
    end
  end
end
