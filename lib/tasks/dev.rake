namespace :dev do
  task :fetch_course => :environment do
    puts "Fetch course data..."
    response = RestClient.get "https://api.coursera.org/api/courses.v1?start=800&limit=100&fields=instructorIds,photoUrl&includes=instructorIds"
    data = JSON.parse(response.body)
    data["elements"].each do |c|
      existing_course = Course.find_by_coursera_id(c["id"])
      if existing_course.nil?
        Course.create!(:coursera_id => c["id"], :name => c["name"], :courseType => c["courseType"], :photoUrl => c["photoUrl"], :slug => c["slug"], :instructorIds => c["instructorIds"])
      end
    end

    puts "Total: #{Course.count} courses"
  end
end
