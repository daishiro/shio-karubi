require 'spec_helper'

describe IndexController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'oauth'" do
    it "returns http success" do
      get 'oauth'
      response.should be_success
    end
  end

  describe "GET 'callback'" do
    it "returns http success" do
      get 'callback'
      response.should be_success
    end
  end

end
