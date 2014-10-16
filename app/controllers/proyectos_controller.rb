class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]
  before_action :set_meses   , only: [:edit,:new,:create,:update]
  before_action :ser_clientes ,only: [:edit,:new,:create,:update]
  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html {
          flash[:success] = 'Proyecto creado satisfactoriamente'
          redirect_to @proyecto
        }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html {
        flash[:success]='Proyecto actualizado Satisfactoriamente'
        redirect_to @proyecto
        }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html {
      redirect_to proyectos_url
      flash[:success] = 'Empleado Eliminado satisfactoriamente'
      }
      format.json { head :no_content }
    end
  end

  private
  def ser_clientes
    @clientes = Cliente.all
  end


  def set_meses
    @meses = %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto
                Septiembre Octubre  Noviembre Diciembre)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_proyecto
    @proyecto = Proyecto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def proyecto_params
    params.require(:proyecto).permit(:fecha_inicio, :fecha_fin, :cliente_id, :nombre)
  end
end
