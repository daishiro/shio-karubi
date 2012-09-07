class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def self.consumer
    OAuth::Consumer.new(
      '3wMmDB7RoWvRsrSB9kTj4g',
      'AFeco43tVoAG3e9MNYdybrC2vArOPSShNt9t7M9QVb0',
      {site: "http://api.twitter.com"}
    )
  end
end
