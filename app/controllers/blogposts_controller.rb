class BlogpostsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def create
  	@blogpost = current_user.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "blogpost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
  private

	def micropost_params
	  params.require(:blogpost).permit(:content)
	end

	def correct_user
      @blogpost = current_user.blogposts.find_by(id: params[:id])
      redirect_to root_url if @blogpost.nil?
    end
end
