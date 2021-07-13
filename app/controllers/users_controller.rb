class UsersController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/search?name=Name&email=Email
  def search
    name = user_params[:name] ? user_params[:name].downcase: ' '
    email = user_params[:email] ? user_params[:email].downcase: ' '
    @users = User.where("lower(name) LIKE ? OR lower(email) LIKE ?", "%#{name}%", "%#{email}%").map{|x| x.as_json}
    render json: @users
  end

  # GET /users/fetch?name=Name&email=Email
  def fetch
    @user = User.find_by!(user_params)
    render json: @user
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email)
    end
end
