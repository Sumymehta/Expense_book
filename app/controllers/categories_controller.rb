class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
 
  def show
    @category = Category.find(params[:id])
  end
  
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
     if @category.save
        flash[:success] = "Category saved successfully!"
        redirect_to categories_path
     else
       render 'new'
     end
   end

   private

     def category_params
        params.require(:category).permit(:name, :description)
     end
end
