class WelcomeController < ApplicationController
  def home
    @categories = Category.all
    @activities = Activity.all
  end
end
