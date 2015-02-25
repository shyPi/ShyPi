class ShushersController < ApplicationController
  before_action :find_shusher, only: [ :update, :show, :destroy ]

  def create
    @shusher = Shusher.new shusher_params
    if @shusher.save
      redirect_to @shusher, notice: "Shusher created successfully."
    else
      #render :new
    end
  end

  def update
    #find_shusher
    if @shusher.update shusher_params
      redirect_to @shusher, notice: "Shusher updated successfully."
    else
      #render :edit
    end
  end

  def show
    #find_shusher, goes to show.html.erb file
  end

  def index
    @entire_shushers = Shusher.all
  end

  def destroy
    #find_shusher
    @shusher.destroy
    redirect_to shushers_path, notice: "Shusher deleted successfully."
  end

  private

    def find_shusher
      @shusher = Shusher.find params[:id]
    end

    def shusher_params
      params.require(:campaign).permit(:name, :sound_threshold, :shout_msg)
    end
end