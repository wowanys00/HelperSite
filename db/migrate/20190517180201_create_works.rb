class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.string :photos
      t.integer :views, default:0

      t.timestamps
    end
  end
end
