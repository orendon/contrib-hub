desc "This task is called hourly to sync github data"

task :sync_github_data => :environment do
  puts "Updating github user data..."

  max_records = ENV["LIMIT"]
  User.order("last_sync asc").limit(max_records).each do |user|
    puts "syncing #{user.github_id}..."

    user.sync_github_data
  end

  puts "done."
end