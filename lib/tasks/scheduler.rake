desc "This task is called hourly to sync github data"

task :sync_github_data => :environment do
  puts "Updating github user data..."

  max_records = ENV["LIMIT"]
  User.order("last_sync asc").limit(max_records).each do |user|
    puts "syncing #{user.github_id}..."

    begin
      user.sync_github_data
    rescue Exception => e
      puts "error ocurred, logging..."
      ErrorLog.create(message: e.message, backtrace: e.backtrace,
        action: 'sync_github_data', extras: user.github_id)
    end
  end

  puts "done."
end