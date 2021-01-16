class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
