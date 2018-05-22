class CategoriesController < ApplicationController
  before_action :require_admin_status, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.all
    respond_to do |format|
      format.json { render json: @categories }
      format.html
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      flash.now[:alert] = "Category must have a title"
      render "new"
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(category_params)
    if @category.save
      redirect_to @category
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :icon)
  end
end
