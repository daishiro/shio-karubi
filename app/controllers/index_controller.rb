class IndexController < ApplicationController
  def index
  end

  def oauth
    callback_url = "http://shio-karubi.herokuapp.com/callback"
    request_token = self.class.consumer.get_request_token(oauth_callback: callback_url)

    session[:request_token] = {
      token: request_token.token,
      secret: request_token.secret
    }
    
    redirect_to request_token.authorize_url
  end

  def callback
    if params[:denied]
      session.delete :oauth
    else
      request_token = OAuth::RequestToken.new(
        self.class.consumer,
        session[:request_token][:token],
        session[:request_token][:secret]
      )

      access_token = request_token.get_access_token(
        {},
        oauth_token: params[:oauth_token],
        oauth_verifier: params[:oauth_verifier]
      )

      session[:oauth] = {
        token: access_token.token,
        secret: access_token.secret
      }
    end

    session.delete :request_token
    redirect_to :index
  end

end