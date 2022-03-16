class StaticPagesController < ApplicationController
  def home
    if current_user.present?
        @blogpost = current_user.blogposts.build if require_log_in?
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