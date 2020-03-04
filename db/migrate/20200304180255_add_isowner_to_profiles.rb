class AddIsownerToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :isowner, :integer
  end
end
