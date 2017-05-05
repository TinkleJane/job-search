class CoursesController < ApplicationController

  def index
    @courses = Course.paginate(:page => params[:page], :per_page => 10)
  end
end
