class AddViewToTotalPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :total_points, :view, :integer
  end
end
