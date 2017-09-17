require 'sinatra'
require "sinatra/reloader" if development?


enable :sessions
n = rand 1..10

get '/' do
  "Guess a number between 1 and 10......Ready......Set......GO"
end

get '/:guess' do

  if session["user_guess"].nil?
     session["user_guess"] = 0
  end

  if session["user_guess"] < 2
    if params[:guess].to_i == n
      return "You Won!!"
    else
      session["user_guess"] += 1
      return "Try again, you have #{3-session["user_guess"]} chances"
    end
  else
    session[:failedCounter] += 1
    return "Game Over!!!, the correct guess is #{n}. Total number of failed attempts are #{session[:failedCounter].to_s} "
  end
end
