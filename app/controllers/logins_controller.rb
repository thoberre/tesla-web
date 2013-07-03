class LoginsController < ApplicationController
  before_action :set_login, only: [:show, :edit, :update, :destroy]

  # GET /logins/new
  def new
    @login = Login.new
  end

  # POST /logins
  # POST /logins.json
  def create
    @login = Login.new(login_params)

    respond_to do |format|
      if @login.valid?
	tesla = TeslaAPI::Connection.new(@login.name, @login.password)
	mycar = tesla.vehicle
	result = [mycar.color, mycar.display_name, mycar.id, mycar.vehicle_id, mycar.user_id, mycar.vin, mycar.online_state, mycar.option_codes ]
	puts(mycar.online_state)
        format.html { redirect_to @login, notice: result }
        format.json { render action: 'show', status: :created, location: @login }
	puts("--------__________-----------")
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
      params.require(:login).permit(:name, :password)
    end
end
