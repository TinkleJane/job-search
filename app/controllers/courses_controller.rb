class CoursesController < ApplicationController
  def index
    @courses = Course.paginate(:page => params[:page], :per_page => 10)
  end

  def search
    if params[:query]
      response = RestClient.get "https://api.coursera.org/api/courses.v1?q=search&fields=instructorIds,partnerIds,photoUrl&start=1&limit=100&includes=instructorIds,partnerIds", {:params => {:query => params[:query]}}
      @courses = JSON.parse(response.body)["elements"]
    end
  end
end
