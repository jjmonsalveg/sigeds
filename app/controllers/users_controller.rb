# encoding: UTF-8
class UsersController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user   , only: [:edit, :update]
  before_action :no_delete_admin  , only: :destroy
  before_action :gerente_ds_user  , only: [:new, :create, :edit, :update,
                                           :index,:destroy]
  before_action :correct_user     , only: :show
  def index
    @users = User.all       #paginate(page: params[:page]) #, per_page  => 30
  end

  def show
    # @user = User.find(params[:id])
    @personal= @user.personal
  end

  def new
    @user= User.new
    return_personals_without_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user  aplicacion anterior (AA)
      flash[:success] = "Usuario Creado!"
      redirect_to users_path
    else
      return_personals_without_user
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id]) #si correct_user existe entonces no necesario
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]= "Usuario Actualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario Eliminado"
    redirect_to users_url
  end

  private

  def user_params
    if current_user.gerente_ds?
      params.require(:user).permit(:email, :password,
                                   :password_confirmation,:rol,:personal_id)
    end
  end

  # Before filters

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) or current_user.gerente_ds?
  end

  #no permite a un admin borrarse a si mismo
  def no_delete_admin
    if current_user.gerente_ds?
      @user = User.find(params[:id])
      if current_user?(@user)
        flash[:danger] = "No puede Borrarse a si mismo por ser Gerente Ds"
        redirect_to users_path
      end
    end
  end
  # Confirms an admin user.  CAMBIO POR ROLES VEREMOS
  # def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end

  # confirms that the user is authorized
  def gerente_ds_user
    unless current_user.gerente_ds?
      flash[:danger] = "No posee permisos para Eliminar Usuarios"
      redirect_to current_user
    end
  end

  def return_personals_without_user()
    @personals = Personal.joins("LEFT JOIN users ON personals.id = users.personal_id where users.id IS NULL")
  end

end
