class UsersController < ApplicationController
before_action :set_user, only: [:edit, :show, :update]
before_action :require_login, only: [:show, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_sign_in_path(@user.id), notice: "登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
   if @user.update(user_params)
     redirect_to user_path(@user), notice: "ユーザ登録を編集しました"
   else
     render :edit
   end
 end

   private
     def user_params
       params.require(:user).permit(:email, :password, :password_confirmation)
     end

     def set_user
       @user = User.find(params[:id])
     end

     def require_login
       unless logged_in? && @current_user.id ==  @user.id
         redirect_to users_sign_in_path
       end
     end
end
