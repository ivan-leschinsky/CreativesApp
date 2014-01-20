class AddUserToCreative < ActiveRecord::Migration
  def change
    add_column :creatives, :user_id, :integer, :default => 0
  end
end
