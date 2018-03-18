class TopController < ApplicationController
  def index
        @posts = Post.all
        @informations = Information.all
  end
end
