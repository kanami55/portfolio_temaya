class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :production_period
      t.integer :cost
      t.float :difficulty
      t.text :explanation

      t.timestamps
    end
  end
end
