class CreateUrlsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :urls_users do |t|

      t.timestamps
    end
  end
end
