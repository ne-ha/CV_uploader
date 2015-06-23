class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:check_valid_email]

  def check_valid_email
    user = User.find_by_email(params[:user][:email])

    respond_to do |format|
      format.json {render :json => !user}
    end
  end
end
