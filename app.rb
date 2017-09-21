require 'sinatra'
require "sinatra/reloader" if development?


enable :sessions
n = rand 1..10

get '/' do
  "Guess a number between 1 and 10......Ready......Set......GO"
end

get '/:guess' do

  if session[:attempt].nil?
     session[:attempt] = 0
  end

  if session[:attempt] < 4

          session[:attempt] += 1
          if params[:guess].to_i == n
            return "You Won!!"

          else
            remainingAttempts = 3 - session[:attempt].to_i
            return "Try again, you have #{remainingAttempts} more attempts"
          end

  else
    return "Game Over!!!, the correct guess is #{n}."
  end

end
