class UsersController < Clearance::UsersController
  
  def create
     @user = user_from_params

     if @user.save
       sign_in @user
       redirect_to welcome_path
     else
       render template: "users/new"
     end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # byebug
    # params = user_params.delete(params[:passw])
    if @user.update(update_user_params)
      redirect_to user_path(@user.id)
    else 
      render template: "users/edit"
    end 
  end

  def destroy
    if @user = User.find(params[:id])
      @user.destroy
      redirect_to welcome_path
    else
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def update_user_params
    if params[:user][:password] == ''
      params.require(:user).permit(:email)
    else
      user_params
    end
  end
end

