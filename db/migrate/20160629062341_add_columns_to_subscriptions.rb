class AddColumnsToSubscriptions < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :tag_id, :integer
    add_column :subscriptions, :user_id, :integer
  end
end
