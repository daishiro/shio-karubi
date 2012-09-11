class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def self.consumer
    OAuth::Consumer.new(
      ENV['SHIOKARUBI_KEY'],
      ENV['SHIOKARUBI_SECRET'],
      {site: "http://api.twitter.com"}
    )
  end
end

