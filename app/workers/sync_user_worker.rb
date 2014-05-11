class SyncUserWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5, backtrace: true

  def perform(user_id)
    user = User.find user_id
    begin
      user.sync_github_data
    rescue Exception => e
      ErrorLog.create(message: e.message, backtrace: e.backtrace.to_s,
      action: 'sync_github_data', extras: user.github_id)
    end
  end
end
