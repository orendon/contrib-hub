class AddUserDescription < ActiveRecord::Migration
  def up
    add_column :repos, :user_description, :text
  end

  def down
    remove_column :repos, :user_description
  end
end
