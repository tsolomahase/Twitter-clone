class TweeetsController < ApplicationController
  before_action :set_tweeet, only: [:show, :edit, :update, :destroy]


  def index
    @tweeets = Tweeet.all.order("created_at DESC")
    @tweeet = Tweeet.new
  end


  def show
  end

  def new
    if params [:back]
      @tweeet = Tweeet.new(tweeet_params)
    else
      @tweeet = Tweeet.new
    end
  end

  def edit
  end


  def create
    @tweeet = Tweeet.new(tweeet_params)

    respond_to do |format|
      if @tweeet.save
        format.html { redirect_to root_path, notice: 'Tweeet was successfully created.' }
        format.json { render :show, status: :created, location: @tweeet }
      else
        format.html { render :new }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end
  def confirm_pg
        @tweeet = Tweeet.new(tweeet_params)
        render :new if @tweeet.invalid?
      end
      def back
        @tweeet = Tweeet.edit(tweeet_params)
        render :choose_new_or_edit if @tweeet.invalid?
      end

  def update
    respond_to do |format|
      if @tweeet.update(tweeet_params)
        format.html { redirect_to @tweeet, notice: 'Tweeet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweeet }
      else
        format.html { render :edit }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tweeet.destroy
    respond_to do |format|
      format.html { redirect_to tweeets_url, notice: 'Tweeet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_tweeet
      @tweeet = Tweeet.find(params[:id])
    end

    def tweeet_params
      params.require(:tweeet).permit(:tweeet)
    end
end
