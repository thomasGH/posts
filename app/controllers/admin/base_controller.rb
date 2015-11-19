class Admin::BaseController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :check_admin

	layout 'admin'

	protected

  def set_category
    @category = Category.find(params[:id])
  end

	def check_admin
		unless current_user.admin?
			redirect_to root_path, alert: "У вас нет прав на просмотр этой страницы"
		end
	end

  def cat_params
    params.require(:category).permit(:name)
  end
end