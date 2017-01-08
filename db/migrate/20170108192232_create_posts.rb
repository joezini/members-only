class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
    add_reference :posts, :user, foreign_key: true
  end
end
