class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :user_id
      t.string :name
      t.string :github_url
      t.boolean :need_help

      t.timestamps
    end
  end
end
