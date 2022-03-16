class BlogpostsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  def create
  	@blogpost = current_user.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "blogpost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  private

	def micropost_params
	  params.require(:blogpost).permit(:content)
	end
end
