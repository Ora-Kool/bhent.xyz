class BlogsController < ApplicationController
  def index
  	@admin = Admin.find_by(id: params[:admin_id])
  	@blogs = Blog.all
  end

  def new
  	@admin = Admin.find_by(id: params[:admin_id])
  	@blog = Blog.new
  end

  def create
  	@admin = Admin.find_by(id: params[:admin_id])
  	@blog = @admin.blogs.new(blog_params)
  	if @blog.save
  		flash[:success] = "Article uploaded successfully."
  		redirect_to current_admin
  	else
  		render 'new'
  	end
  end

  def details
  	@blog = Blog.find_by(id: params[:id])
  end

  def show
  	@admin = Admin.find_by(id: params[:admin_id])
  	@blog = Blog.find_by(id: params[:id])
  end

  private

  def blog_params
  	params.require(:blog).permit(:title, :description, :image)
  end
end
