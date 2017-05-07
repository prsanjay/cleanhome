class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:index,:destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.bookings.new
  end

  # GET /customers/1/edit
  def edit

  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.where('phone_number=?',customer_params[:phone_number]).first
    if @customer.present?
      booking = @customer.bookings.create(customer_params[:bookings_attributes]["0"])
      respond_to do |format|
        if booking.errors.present?
          @customer.errors.add(:base,'No Available Cleaner.')
          format.html { render :new }
          format.json { render json: booking.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to @customer, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @customer }
        end
      end
    else # IF CUSTOMER NOT PRESENT
      @customer = Customer.new(customer_params)
      respond_to do |format|
        if @customer.save
          format.html { redirect_to @customer, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @customer }
        else
          format.html { render :new }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone_number,:bookings_attributes => [:id,:booking_date,:booking_time,:city_id,:cleaner_id,:_destroy])
    end
end
