class AddCollegeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :college, :string
  end
end
