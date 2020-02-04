class AddDislikesToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :dislikes, :integer
  end
end
