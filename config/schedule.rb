set :output, 'log/whenever.log'

every :day, at: '12am' do
  rake 'sync:all'
end
