class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  # ログイン実装まで暫定的にスキップ
  skip_before_action :require_login

  def index
    @categories = Category.all
  end
  
  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_url(@category), notice: "Category was successfully created."
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category was successfully destroyed."
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
