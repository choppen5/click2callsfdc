click2callsfdc
==============

Code for TwilioCon presentation on getting click2call in a browswer

Pre requisites:
- Sinatra
- twilio-ruby
- Twilio account info handy (account id, authoken, and twilio app id)
- tunnel service to expose web server if its running locally

Setup:
- git clone the repo
- cd click2calsfdc 
- set environment variables (twilio_account_sid, twilio_account_token, twilio_app_Quickstart) like so:
export twilio_account_sid=myaccountid
- ruby client.rb

This will start the server

Point SFDC to the environment:
1. In your  SFDC envirnoment, go to Create > Call Centers (import)
2. Import DemoAdapterTwilio.xml
3. Change the web address to the webserver you created during setup (either local host, heroku, etc)

To get click2dial working, you need to add the code from codesnips.html into the code base

