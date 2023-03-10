class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @shops = Shop.all.map { |shop| [shop.name, shop.id] }
    @car = Car.new
    @user = session[:current_user_id]
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    @car.user_id = session[:current_user_id]

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        @shops = Shop.all.map { |shop| [shop.name, shop.id] }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    if @car.user_id == session[:current_user_id] || @user.admin == true 
      respond_to do |format|
        if @car.update(car_params)
          format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
          format.json { render :show, status: :ok, location: @car }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    else

    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    if @car.user_id == session[:current_user_id] || @user.admin == true 
      @car.destroy

      respond_to do |format|
        format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to cars_url, notice: "This car can only be removed by the creator." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:make, :model, :year, :price, :odometer, :shop_id, :user_id)
    end
end
