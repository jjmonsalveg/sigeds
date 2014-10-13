class ContactosController < ApplicationController
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

  def index
    @cliente   = Cliente.find(params[:cliente_id])
    @contactos = @cliente.contactos
  end

  def show
    @cliente  = Cliente.find(@contacto.cliente_id)
  end

  def new
    @cliente  = Cliente.find(params[:cliente_id])
    @contacto = @cliente.contactos.build
  end

  def edit
    @cliente = @contacto.cliente_id
  end

  def create
    @cliente  = Cliente.find(params[:cliente_id])
    @contacto = @cliente.contactos.build(contacto_params)

    respond_to do |format|
      if @contacto.save
        format.html {
          flash[:success] = 'Contacto creado satisfactoriamente'
          redirect_to @contacto
        }
        format.json { render :show, status: :created, location: @contacto }
      else
        format.html { render :new }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contacto.update(contacto_params)
        format.html {
          flash[:success]='Contacto actualizado Satisfactoriamente'
          redirect_to @contacto
        }
        format.json { render :show, status: :ok, location: @contacto }
      else
        @cliente = @contacto.cliente_id
        format.html { render :edit }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    id = @contacto.cliente_id
    @contacto.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Contacto Eliminado satisfactoriamente'
        redirect_to cliente_contactos_path(id)
      }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contacto
    @contacto = Contacto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contacto_params
    params.require(:contacto).permit(:email, :nombre, :telefonoCelular, :telefonoOficina, :cliente_id)
  end
end
