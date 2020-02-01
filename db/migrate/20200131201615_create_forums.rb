class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :title
      t.text :content
      t.integer :subject_id
      t.integer :user_id

      t.timestamps
    end
  end
end
