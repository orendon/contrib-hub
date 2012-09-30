class AddColumnToRepo < ActiveRecord::Migration
  def change
    add_column :repos, :github_id, :integer
    add_column :repos, :full_name, :string
    add_column :repos, :description, :text
    add_column :repos, :language, :string
    add_column :repos, :forks, :integer
    add_column :repos, :watchers, :integer
    add_column :repos, :open_issues, :integer
    add_column :repos, :pushed_at, :datetime
  end
end
