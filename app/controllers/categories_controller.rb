class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
 
  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
     if @category.save
        flash[:success] = "Category saved successfully!"
        redirect_to @category
     else
       render 'new'
     end
   end

   private

     def category_params
        params.require(:category).permit(:name, :description)
     end
end
