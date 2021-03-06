# encoding: UTF-8
class ClientesController < ApplicationController
  before_action :logged_in_user
  before_action :authorized
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html {
          flash[:success] = 'Cliente creado satisfactoriamente'
          redirect_to @cliente
        }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html {
          flash[:success]='Cliente actualizado Satisfactoriamente'
          redirect_to @cliente
        }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Empleado Eliminado satisfactoriamente'
        redirect_to clientes_url
      }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cliente_params
    params.require(:cliente).permit(:direccion, :direccionFiscal, :fax,:nombre,
                                    :rif, :url) if authorized?
  end

  def authorized?
    current_user.asistente_administracion? or current_user.gerente_ds?
  end

  def authorized
    unless authorized?
      flash[:danger] = "No posee permisos para realizar esta acción"
      redirect_to current_user
    end
  end

end
