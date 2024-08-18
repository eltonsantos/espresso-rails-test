# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def index
    @users = current_user.company.users
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    @user.role = 1
    @user.company_id = current_user.company_id
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password

    respond_to do |format|
      if @user.save
        UserMailer.with(user: @user, password: generated_password).welcome_employee.deliver_now
        format.html { redirect_to users_path, notice: I18n.t('users.create.success') }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: I18n.t('users.update.success') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
