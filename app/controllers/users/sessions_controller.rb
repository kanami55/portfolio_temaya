class Users::SessionsController < ApplicationController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'guestuserでログインしました。'
  end
end
