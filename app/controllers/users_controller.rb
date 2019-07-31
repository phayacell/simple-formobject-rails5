class UsersController < ApplicationController
  before_action :user_by_id, only: [:edit, :update]

  def edit
    @form = Users::EditForm.new(@user)
  end

  def update
    @form = Users::EditForm.new(@user, user_params)

    if @form.save
      redirect_to user_edit_url
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:users_edit_form).permit(
        user_attributes: [
          :email,
        ],
        profile_attributes: [
          :name,
          :address,
        ],
      )
    end

    def user_by_id
      @user = User.find_by!(id: params[:id])
    end
end
