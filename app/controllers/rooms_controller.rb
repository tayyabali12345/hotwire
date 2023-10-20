class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

    # GET /search?search='abc'
  def search
    @rooms = Room.where("name LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
    respond_to do |format|
      format.json { render json: render_to_string(partial: 'rooms/room', collection: @rooms, formats: [:html])}
    end
  end

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: I18n.t('room_created')  }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: I18n.t('room_updated')  }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: I18n.t('room_destroyed')  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name)
    end
end
