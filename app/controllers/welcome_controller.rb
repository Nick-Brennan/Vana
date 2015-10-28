class WelcomeController < ApplicationController
  require 'httparty'
  require 'uri'
  require 'polylines'
  def index
  end

  def logout
  	session[:user_id] = nil
  	redirect_to '/'
  end

  def home
  	@user = current_user
  	@plan = Plan.new
  	client = Strava::Api::V3::Client.new(:access_token => @user.token)
  	@user_runs = client.list_athlete_activities(per_page: 200)
  end

	def strava_auth
	    code = params["code"]
	    response_temp = HTTParty.post("https://www.strava.com/oauth/token", :body => {
		    :client_id => ENV['STRAVA_ID'],
		    :client_secret => ENV['STRAVA_KEY'],
		    :code => code
	    }.to_json,
	    headers: {'Content-Type'=>'application/json'})

	    id = response_temp.parsed_response["athlete"]["id"]
	    user = User.find_by strava_id: id

	    if !user
		    user = User.new
		    user.token = response_temp.parsed_response["access_token"]
		    user.strava_id = response_temp.parsed_response["athlete"]["id"]
		    user.firstname = response_temp.parsed_response["athlete"]["firstname"]
		    user.lastname = response_temp.parsed_response["athlete"]["lastname"]
		    user.email = response_temp.parsed_response["athlete"]["email"]
		    user.city = response_temp.parsed_response["athlete"]["city"]
		    user.state = response_temp.parsed_response["athlete"]["state"]
		    user.profile_img = response_temp.parsed_response["athlete"]["profile"]       
	    end

	    user.firstname = response_temp.parsed_response["athlete"]["firstname"]
	    user.lastname = response_temp.parsed_response["athlete"]["lastname"]
	    user.email = response_temp.parsed_response["athlete"]["email"]
	    user.city = response_temp.parsed_response["athlete"]["city"]
	    user.state = response_temp.parsed_response["athlete"]["state"]
	    user.profile_img = response_temp.parsed_response["athlete"]["profile"]
	    user.save

	    session[:user_id] = user.id    
	    redirect_to '/home'
	end
end
