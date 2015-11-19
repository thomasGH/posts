class Admin::CategoriesController < Admin::BaseController
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def create
		@category = Category.new(cat_params)

    if @category.save
      redirect_to admin_categories_url, notice: 'Category was successfully created.'
    else
      render :new
    end
	end

	def update
    if @category.update(cat_params)
      redirect_to admin_categories_url, notice: 'Category was successfully updated.'
    else
      render :edit
    end
	end

	def destroy
    @category.destroy

    redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
	end
end