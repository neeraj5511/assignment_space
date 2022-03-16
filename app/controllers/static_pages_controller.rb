class StaticPagesController < ApplicationController
  def home
    if current_user.present?
        @blogpost = current_user.blog_posts.build
        @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end