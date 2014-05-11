set :output, 'log/whenever.log'

every :monday, at: '12am' do
  rake 'sync:all'
end
