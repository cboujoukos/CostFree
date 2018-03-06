class WelcomeController < ApplicationController
  def home
    @categories = Category.all
    @activities = Activity.all
    @newest_activities = Activity.recently_added.first_twelve
    @first_six_categories = Category.popular_categories
  end
end
