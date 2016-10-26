class HomeController < ApplicationController
  def index
  end

  def agency
  end

  def portfolio
  end

  def branding
  end

  def blog
    @blogs = Blog.all
  end

  def support
  end
end
