class AddResumesCountToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :resumes_count, :integer, default: 0
  end
end
