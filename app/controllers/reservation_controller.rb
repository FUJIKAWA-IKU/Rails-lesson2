class ReservationController < ApplicationController
  before_action :set_current_user
  
  def create
    @reservation = Reservation.new(
      user_id: @current_user.id,
      room_id: params[:room_id],
      start: params[:start],
      end: params[:end],
      people: params[:people]
    )
    @reservation.save
    flash[:notion] = "予約が完了しました"
    redirect_to("/")
  end

end