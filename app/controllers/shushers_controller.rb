class ShushersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_shusher, only: [ :edit, :update, :show, :destroy ]

  def new
    #render nothing:true
    @shusher = Shusher.new
  end

  def create
    #raise params.inspect
    #raise request.class.to_s.inspect
    #raise request.env["omniauth.auth"].inspect

    @shusher = Shusher.new shusher_params
    if @shusher.save
      redirect_to @shusher, notice: "Shusher created successfully."
    else
      render :new
    end
  end

  def edit
    #find_shusher
  end

  def update
    #find_shusher
    if @shusher.update shusher_params
      redirect_to @shusher, notice: "Shusher updated successfully."
    else
      render :edit
    end
  end

  def show
    #find_shusher, goes to show.html.erb file
  end

  def index
    return get_by_mac_address if params[:mac_address]

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
      params.require(:shusher).permit(:name, :sound_threshold, :shout_msg)
    end

    def get_by_mac_address
      @shusher = Shusher.find_by_mac_address(params[:mac_address])
      render json: @shusher.to_json
    end
end