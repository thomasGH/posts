class Admin::UsersController < Admin::BaseController
	def index
		@users = User.all
	end

	def destroy

		@users = User.find(params[:id])
    @users.destroy

    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
	end
end