class WelcomeController < ApplicationController
  def home
    @categories = Category.all
    @activities = Activity.all
    @first_twelve_activities = Activity.first_twelve
    @first_six_categories = Category.popular_categories
  end
end
