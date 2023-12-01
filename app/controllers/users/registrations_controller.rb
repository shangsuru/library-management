# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @user = current_user
    if current_user.google_account?
      redirect_to root_path, alert: "You can't edit your profile if you are logged in with Google"
      return
    end
    if current_user.librarian?
      render "edit", layout: "librarian"
    else
      render "edit", layout: "user"
    end
  end

  protected
    def after_update_path_for(resource)
      user_path
    end
end
