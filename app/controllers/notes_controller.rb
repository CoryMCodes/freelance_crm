class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  before_action :set_note, only: [ :destroy ]

  def create
    @note = @client.notes.build(note_params)
    @note.user = current_user

    if @note.save
      redirect_to @client, notice: "Note was successfully added."
    else
      redirect_to @client, alert: "Note could not be added."
    end
  end

  def destroy
    @note.destroy
    redirect_to @client, notice: "Note was successfully deleted."
  end

  private

  def set_client
    @client = current_user.clients.find(params[:client_id])
  end

  def set_note
    @note = @client.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
