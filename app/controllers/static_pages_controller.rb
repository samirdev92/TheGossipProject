class StaticPagesController < ApplicationController

  def home
    redirect_to gossips_path if moussaillon_signed_in?
  end

  def error
  end

end
