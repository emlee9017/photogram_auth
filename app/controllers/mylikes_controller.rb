class MylikesController < ApplicationController
  def index
  	@user = User.find(current_user.id)
  	@photos=@user.liked_photos
  end
end
