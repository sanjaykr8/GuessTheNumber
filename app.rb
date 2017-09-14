require 'sinatra'
require "sinatra/reloader" if development?


enable :sessions
#session["user_guess"] = 0
# total_users = 0
n = rand 1..10

get '/' do
  # if session[“user_guess”].nil?
    #  session[“user_guess”] = 0
  #  end
  #total_users = 0

  "Guess a number between 1 and 10......Ready......Set......GO"
end

get '/:guess' do
  #total_users += 1

  if session["user_guess"].nil?
     session["user_guess"] = 0
  end

  if session["user_guess"] <= 2
    if params[:guess].to_i == n
      return "You Won!!"
    else
      session["user_guess"] += 1
      return "Try again, you have #{3-session["user_guess"]} chances"
    end
  else
    return "Game Over!!!, the correct guess is #{n}"
  end
end
