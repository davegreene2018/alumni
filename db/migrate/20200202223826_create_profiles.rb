class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :status
      t.text :about

      t.timestamps
    end
  end
end
