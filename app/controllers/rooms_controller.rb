class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
  end

  def create
    @room = Room.new(
      name: params[:name],
      introduction: params[:introduction],
      price: params[:price],
      address: params[:address],
      user_id: @current_user.id
    )

    if params[:image]
      @room.image_name = "#{@room.name}.jpg"
      image = params[:image]
      File.binwrite("public/room_image/#{@room.image_name}", image.read)
    else
      @room.image_name = "default_room.png"
    end

    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to("/users/#{@current_user.id}")
    else
      render("rooms/new")
    end
  end

  def search_area
    @rooms = Room.search_area(params[:search])
  end

  def search_keyword
    @rooms = Room.search_keyword(params[:search])
  end
    
  def show
    @room = Room.find_by(id: params[:id])
  end

end
