class AddForkFlagToRepo < ActiveRecord::Migration
  def change
    add_column :repos, :fork, :boolean
  end
end
