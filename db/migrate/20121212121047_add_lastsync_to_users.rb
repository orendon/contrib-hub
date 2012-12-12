class AddLastsyncToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_sync, :datetime
    add_column :repos, :last_sync, :datetime
  end
end
