# https://github.com/rails/rails/blob/master/railties/lib/rails/generators/rails/scaffold_controller/templates/controller.rb

class UsersController < ApplicationController
  before_action :authenticate_account!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # cancancan controller
  # load_resource except: [:index, :create]
  # authorize_resource

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: I18n.t('users.controller.create', default: 'User was successfully created.')
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('users.controller.update', default: 'User was successfully updated.')
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: I18n.t('users.controller.destroy', default: 'User was successfully destroyed.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :notes)
    end
end
