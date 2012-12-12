class AddCountersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :avatar_url, :string
    add_column :users, :github_url, :string
    add_column :users, :followers, :integer
    add_column :users, :following, :integer
    add_column :users, :public_repos, :integer
    add_column :users, :public_gists, :integer
  end
end
