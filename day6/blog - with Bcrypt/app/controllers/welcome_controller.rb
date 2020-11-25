class WelcomeController < ApplicationController
  def index
		@user = current_user
		@articles = Article.all
  end
end
