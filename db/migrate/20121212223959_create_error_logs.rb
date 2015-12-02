class CreateErrorLogs < ActiveRecord::Migration
  def change
    create_table :error_logs do |t|
      t.string :message
      t.string :action
      t.text   :backtrace
      t.string :extras

      t.timestamps null: false
    end
  end
end
