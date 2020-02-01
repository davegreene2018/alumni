class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :reply
      t.integer :forum_id
      t.integer :user_id
      t.integer :votes

      t.timestamps
    end
  end
end
