class WelcomeController < ApplicationController
  def home
    @categories = Category.all
    @activities = Activity.all
    @first_twelve_activities = Activity.first_twelve
  end
end
