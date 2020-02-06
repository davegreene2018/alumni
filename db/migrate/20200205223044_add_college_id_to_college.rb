class AddCollegeIdToCollege < ActiveRecord::Migration[6.0]
  def change
    add_column :colleges, :college_id, :integer
  end
end
