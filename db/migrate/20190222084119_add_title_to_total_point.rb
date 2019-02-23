class AddTitleToTotalPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :total_points, :title, :string
  end
end
