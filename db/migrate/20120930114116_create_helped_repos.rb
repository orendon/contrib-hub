class CreateHelpedRepos < ActiveRecord::Migration
  def change
    create_table :helped_repos do |t|
      t.integer :repo_id
      t.integer :user_id
      t.boolean :really_helping

      t.timestamps null: false
    end
  end
end
