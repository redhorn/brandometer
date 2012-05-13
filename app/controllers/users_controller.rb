class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :additional_info]
  before_filter :admin_user, only: :index
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
      redirect_to finish_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # Remove auth_level from the params hash and only allow admins to update this value
    auth_level = params[:user].delete(:auth_level)
    @user.auth_level = auth_level if auth_level and current_user.admin?

    # Store params[:source] to see if update was called from "Complete your profile"
    source = params[:source]

    if @user.update_attributes(params[:user])
      # The remember token is reset on user save, sign in to get a new one
      sign_in @user if current_user?(@user)

      if (source == "finish")
        flash[:success] = (@user.complete?) ? "Thank you for completing your profile, and welcome to Brand-o-meter!" : "You are now logged in. Welcome to Brand-o-meter!"
        redirect_to root_path
      else
        flash[:success] = "Profile updated"
        redirect_to edit_user_path
      end
    else
      if (source == "finish")
        render 'additional_info'
      else
        render 'edit'
      end
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
      redirect_to root_path unless current_user?(@user) or current_user.admin?
    end

    def can_destroy
      user = User.find(params[:id])
      redirect_to root_path unless current_user.admin? or current_user?(user)
    end

end
