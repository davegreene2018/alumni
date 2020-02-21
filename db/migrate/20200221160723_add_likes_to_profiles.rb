class AddLikesToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :likes, :integer
  end
end
