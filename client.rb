require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

disable :protection
 
get '/' do
    # Twilio acount credentials
    account_sid = ENV['twilio_account_sid']
    auth_token = ENV['twilio_account_token']
    demo_app_sid = ENV['twilio_app_Quickstart'] 

    # Generate capability token
    capability = Twilio::Util::Capability.new account_sid, auth_token
    capability.allow_client_outgoing demo_app_sid
    capability.allow_client_incoming "default_client"
    token = capability.generate

    # Render html
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

