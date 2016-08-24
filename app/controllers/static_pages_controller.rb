class StaticPagesController < ApplicationController

  def home
    @user = User.first
  end

end
