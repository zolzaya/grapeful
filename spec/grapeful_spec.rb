require 'spec_helper'

describe Grapeful do
  subject do
    Class.new(Grape::API)
  end

  before do
    subject.format :json
  end

  def app
    subject
  end

  it 'should work without grapeful' do
    subject.get("/home") {"Hello World"}
    get "/home"
    last_response.body.should == "\"Hello World\""
  end

  describe "#ful" do
    it 'ful' do
      subject.get('/users') do
        @user = OpenStruct.new(name: "Bob Marlin")
        ful :user, @user
        ful :fff, 'fffff', root: 'users'
        ful :message, 'foo bar me'
      end

      get '/users'
      last_response.body.should == "{\"user\":\"#<OpenStruct name=\\\"Bob Marlin\\\">\",\"fff\":\"fffff\",\"root\":\"users\",\"message\":\"foo bar me\"}"
    end
  end
end
