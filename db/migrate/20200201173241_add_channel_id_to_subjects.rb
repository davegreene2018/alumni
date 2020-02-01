class AddChannelIdToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :channel_id, :integer
  end
end
