require 'myTeslaAPI'

class LoginsController < ApplicationController
  include TeslaAPI
  before_action :set_login, only: [:show, :edit, :update, :destroy]

  # GET /logins/new
  def new
    @login = Login.new
  end

  # POST /logins
  # POST /logins.json
  def create
    debug = false

    @login = Login.new(login_params)

    if @login.valid?
      @teslaconn = TeslaAPI::Connection.new(@login.name, @login.password)
      if @teslaconn.logged_in?
        login_valid = true
        if @teslaconn.vehicle == nil
          @login.errors.add(:vehicles, 'empty in your profile')
          login_valid = false
        end
      else
        @login.errors.add(:credentials, 'could not log in to REST API')
        login_valid = false
      end
    else
      login_valid = false
    end
    if debug
      login_valid = true
    end

    respond_to do |format|
      if login_valid
        begin
          mycar = @tesla.vehicle
          result = ['TeslaAPI::Success',mycar.color, mycar.display_name, mycar.id, mycar.vehicle_id, mycar.user_id, mycar.vin, mycar.online_state, mycar.option_code_descriptions, 'false' ]
        rescue => e
          result = [e.message]
        end
        begin
          result[9] = mycar.mobile_access?
        rescue
        end

        if debug
          result = ['TeslaAPI::DebugValues','All black', 'Kitt', '321', '2342342344', '123', '5YJSA1CN5CFP01657', 'online', 'lots of options' , 'true' ]
        end

        format.html { redirect_to @login, notice: result }
        format.json { render action: 'show', status: :created, location: @login }
      else
        format.html { render action: 'new' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_login
    @login = Login.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def login_params
    params.require(:login).permit(:name, :password, :terms)
  end
end
