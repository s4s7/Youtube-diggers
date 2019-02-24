class AddThumbnailToTotalPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :total_points, :thumbnail, :string
  end
end
