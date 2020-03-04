class AddStudyingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :studying, :string
  end
end
