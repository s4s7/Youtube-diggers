class AddCategoryToUrls < ActiveRecord::Migration[5.2]
  def change
    add_reference :urls, :category, foreign_key: true
  end
end
