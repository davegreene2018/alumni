class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :channel
      t.integer :subject_id

      t.timestamps
    end
  end
end
