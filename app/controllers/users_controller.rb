class UsersController < ApplicationController
  before_action :set_current_user

  def index
    @users = User.all
  end

  def account
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default_user.png"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録しました"
      redirect_to("/")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.introduction = params[:introduction]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_image/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to("/users/account")
    else
      render("users/edit")
    end

  end

  def login_form
  end

  def login
    @user = User.find_by(
      name: params[:name],
      password: params[:password]
    )

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      render("users/login_form")
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def rooms
    return Room.where(user_id)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def reservations
    @user = User.find_by(id: params[:id])
    @reservations = Reservation.where(user_id: @user.id)
    
  end

end


