class MoviiesController < ApplicationController
  before_action :set_moviie, only: [:show, :edit, :update, :destroy]

  # GET /moviies
  # GET /moviies.json
  def index
    @moviies = Moviie.all
  end

  # GET /moviies/1
  # GET /moviies/1.json
  def show
  end

  # GET /moviies/new
  def new
    @moviie = Moviie.new
  end

  # GET /moviies/1/edit
  def edit
  end

  # POST /moviies
  # POST /moviies.json
  def create
    @moviie = Moviie.new(moviie_params)

    respond_to do |format|
      if @moviie.save
        format.html { redirect_to @moviie, notice: 'Moviie was successfully created.' }
        format.json { render :show, status: :created, location: @moviie }
      else
        format.html { render :new }
        format.json { render json: @moviie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviies/1
  # PATCH/PUT /moviies/1.json
  def update
    respond_to do |format|
      if @moviie.update(moviie_params)
        format.html { redirect_to @moviie, notice: 'Moviie was successfully updated.' }
        format.json { render :show, status: :ok, location: @moviie }
      else
        format.html { render :edit }
        format.json { render json: @moviie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviies/1
  # DELETE /moviies/1.json
  def destroy
    @moviie.destroy
    respond_to do |format|
      format.html { redirect_to moviies_url, notice: 'Moviie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviie
      @moviie = Moviie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moviie_params
      params.require(:moviie).permit(:title, :obtained, :released, :rating, :description)
    end
end
