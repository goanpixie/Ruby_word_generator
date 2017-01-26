Gem file:

gem 'rails-footnotes', '>= 4.0.0', '<5'

----------
Rails.application.routes.draw do
  get 'words/index'

  root 'words#index'

  post 'create_word' => "words#create"


-----------

index:

<div>
	<h2>Random word attempt #<%= session[:views]%></h2>
	<p><%=session[:random_word] if session[:random_word].present?%></p>
</div>

<form action='/create_word' method='post'>
  <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">
  <input type='submit' value='Generate' />
</form> 

----------

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

