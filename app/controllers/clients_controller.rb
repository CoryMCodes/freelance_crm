class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [ :show, :edit, :update, :destroy ]

  def index
    @clients = current_user.clients.ordered
  end

  def show
    @notes = @client.notes.ordered
    @new_note = @client.notes.build
  end

  def new
    @client = current_user.clients.build
  end

  def create
    @client = current_user.clients.build(client_params)

    if @client.save
      redirect_to @client, notice: "Client was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: "Client was successfully deleted."
  end

  private

  def set_client
    @client = current_user.clients.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :phone, :company, :address, tag_ids: [])
  end
end
