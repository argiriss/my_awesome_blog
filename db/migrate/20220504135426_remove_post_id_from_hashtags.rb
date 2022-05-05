class RemovePostIdFromHashtags < ActiveRecord::Migration[6.1]
  def change
    remove_column :hashtags, :post_id
  end
end
