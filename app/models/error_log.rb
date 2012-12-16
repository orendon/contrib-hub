class ErrorLog < ActiveRecord::Base
  attr_accessible :action, :message, :backtrace, :extras

  validates :action, :message, :backtrace, :presence => true
end
