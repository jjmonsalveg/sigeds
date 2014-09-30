# encoding: UTF-8
class PersonalsController < ApplicationController
  before_action :set_personal, only: [:show, :edit, :update, :destroy]
  before_action :asistente_administracion_user
  before_action :no_delete_asistente  , only: :destroy

  # GET /personals
  # GET /personals.json
  def index
    @personals = Personal.all
  end

  # GET /personals/1
  # GET /personals/1.json
  def show
  end

  # GET /personals/new
  def new
    @personal = Personal.new
  end

  # GET /personals/1/edit
  def edit
  end

  # POST /personals
  # POST /personals.json
  def create
    @personal = Personal.new(personal_params)

    respond_to do |format|
      if @personal.save
        format.html {
          flash[:success]="Empleado creado Satisfactoriamente"
          redirect_to @personal
        }
        format.json { render :show, status: :created, location: @personal }
      else
        format.html { render :new }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personals/1
  # PATCH/PUT /personals/1.json
  def update
    respond_to do |format|
      if @personal.update(personal_params)
        format.html { redirect_to @personal
        flash[:success]="Empleado actualizado Satisfactoriamente"
        }
        format.json { render :show, status: :ok, location: @personal }
      else
        format.html { render :edit }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personals/1
  # DELETE /personals/1.json
  def destroy
    @personal.destroy
    flash[:success] = "Empleado Eliminado"
    respond_to do |format|
      format.html { redirect_to personals_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_personal
    @personal = Personal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def personal_params
    if current_user.asistente_administracion?
      params.require(:personal).permit(:nombre, :apellido, :cedula, :direccion, :telefono_casa, :telefono_celular, :sexo, :fecha_nacimiento)
    end
  end

  def asistente_administracion_user
    unless current_user.asistente_administracion?
      flash[:danger] = "No posee permisos para realizar esta acción"
      redirect_to current_user
    end
  end

  def no_delete_asistente
    if current_user.asistente_administracion?
      @user = User.find_by(personal_id: params[:id])
      if current_user?(@user)
        flash[:danger] = "No puede borrar Empleado debe hacerlo el Gerente Ds"
        redirect_to users_path
      end
    end
  end
end
