class HomeController < ApplicationController
  def index
    if current_user
      @users = User.all.map do |user|
        userj = user.as_json
        userj[:imageurl] = url_for(user.image) if user.image.attached?
        userj
      end
    end
  end
end
