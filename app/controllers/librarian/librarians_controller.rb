# frozen_string_literal: true

class Librarian::LibrariansController < ActionController::Base
  before_action :authenticate_user!
  authorize_resource class: false

  layout "librarian"

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.create({ username: params[:username], email: params[:email], password: params[:password], role: :librarian })
    if user.save
      redirect_to librarian_librarians_path, notice: "#{user.username} added as librarian"
    else
      redirect_to librarian_librarians_path, alert: "#{user.username} could not be added as librarian"
    end
  end

  private def user_params
    params.require(:user).permit(:email, :password, :username, :role)
  end

  rescue_from CanCan::AccessDenied do
    redirect_to root_url, alert: "You are not authorized to access this page."
  end
end
