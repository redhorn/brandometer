class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :additional_info]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :can_destroy, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    redirect_to root_path if signed_in?

    @user = User.new
  end

  def create
    redirect_to root_path if signed_in?

    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to complete_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      if (params[:source] == "complete")
        flash[:success] = "Welcome to Brand-o-meter!"
        redirect_to root_path
      else
        flash[:success] = "Profile updated"
        redirect_to edit_user_path
      end
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def additional_info
    @user = current_user
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def can_destroy
      user = User.find(params[:id])
      redirect_to root_path unless current_user.admin? or current_user?(user)
    end

end
