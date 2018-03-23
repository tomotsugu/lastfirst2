class TopController < ApplicationController
  def index
    @posts = Post.where("release = '1'")
    @informations = Information.where("destination = '2' and release = '1'")
  end
end
