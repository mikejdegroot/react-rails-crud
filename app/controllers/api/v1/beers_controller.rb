
class Api::V1::BeersController < ApplicationController
  # call the set_beer methos before each method in the array in order to get the beer by id from the db
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  
  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.all.order(brand: :asc)
    # DEBUGGING!
    # uncomment these lines to test out the debugger
    # @test_val = 'i can read this in debugger'
    # binding.pry

    # uncomment these lines to print variables to the development log
    # logger.debug('----------------------- 🔥')
    # logger.debug(json: @beers)
    # logger.debug('----------------------- 🔥')
    render json: @beers
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    if @beer
      render json: @beer
    else
      render json: @beer.errors
    end
  end

  # GET /beers/new
  def new
    @beer = Beer.new
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)
    # this is how to make http reqs
    # response = HTTParty.get('https://placeimg.com/640/360/nature')
    @beer.image = 'https://placeimg.com/640/360/nature'

    if @beer.save
      render json: @beer
    else
      render json: @beer.errors
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    if @beer
      # update using active record syntax
      @beer.quantity = 12
      @beer.save

      render json: @beer
    else
      render json: @beer.errors
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy

    render json: { notice: 'Beer was successfully removed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def beer_params
      params.permit(:brand, :style, :country, :quantity, :image)
    end
end