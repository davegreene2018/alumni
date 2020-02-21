class AddDislikesToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :dislikes, :integer
  end
end
