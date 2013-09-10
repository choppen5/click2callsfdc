require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
 
get '/' do
    # Find these values at twilio.com/user/account
    account_sid = ENV['twilio_account_sid']
    auth_token = ENV['twilio_account_token']
    # This application sid will play a Welcome Message.
    demo_app_sid = 'AP2b14f34d92cefb0bcce2297a1b34d215'
    capability = Twilio::Util::Capability.new account_sid, auth_token
    capability.allow_client_outgoing demo_app_sid
    capability.allow_client_incoming "default_client"
    token = capability.generate
    puts "token = #{token}"
    erb :index, :locals => {:token => token}
end

post '/dial' do
    caller_id = "+14156882907"
    number = params[:PhoneNumber]
    response = Twilio::TwiML::Response.new do |r|
        r.Dial :callerId => caller_id do |d|
            d.Number number
        end

    end
    puts response.text #for debugging
    response.text
end

