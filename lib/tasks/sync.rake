namespace :sync do
  task :all => :environment do
    puts "Updating all users data..."
    User.all.find_each do |user|
      puts "#{user.slug} - #{user.github_id}"
      SyncUserWorker.perform_async(user.id)
    end
    puts "Updating all users being updated async..."
  end

  task :recent_users => :environment do
    puts "Updating recent users data..."
    User.recent.find_each do |user|
      puts "Syncing #{user.slug} - #{user.github_id}"
      SyncUserWorker.perform_async(user.id)
    end
    puts "Updating recent users being updated async..."
  end
end
