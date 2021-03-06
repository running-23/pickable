class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authorize_category

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_url(@category), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: t('.success')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def authorize_category
    authorize Category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
