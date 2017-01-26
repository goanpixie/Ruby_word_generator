class WordsController < ApplicationController
  def index
  	
  	if !session[:views]
  		session[:views]=0
  		
  	end
  end

  def create
  	session[:random_word] = Array.new(14).map { (65 + rand(26)).chr }.join
  	session[:views]=session[:views]+1
  	redirect_to action: "index"
  end
end


