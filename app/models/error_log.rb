class ErrorLog < ActiveRecord::Base
  validates :action, :message, :backtrace, :presence => true
end
