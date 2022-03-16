class StaticPagesController < ApplicationController
  def home
    @blogpost = current_user.blogposts.build if require_log_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end