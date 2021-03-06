require 'telegram/bot'

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  after_action :send_telegramm, only: :update
  respond_to :js, :html

  def index
    @places = Place.where(occupied: false).sort_by(&:parking_id)
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.create(place_params)
    redirect_to root_path
  end

  def update
    @parkings = Parking.all.includes(:places, :desc)
    respond_to do |format|
      if @place.update(place_params)
        format.json { render json: @place }
        format.js { render status: :ok }
      else
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:number, :parking_id, :occupied, :driver_id)
    end

    def send_telegramm
      places = Place.where(occupied: false)
      token = '219468863:AAFYxwTEuOTag_gRKpk-7eglzM6GxeivQsc'
      if places.count < 4
        plurl = (places.count == 1 ? 'место' : 'места')
        Telegram::Bot::Client.run(token) do |bot|
          bot.api.sendMessage(chat_id: -113195655, text: "Осталось всего #{places.count} #{plurl} на парковке.")
          break
        end
      end
    end

end
