module JobsHelper
  def render_job_created_time(job)
    job.created_at.to_s(:short)
  end

  def render_job_wage(wage)
    number_to_currency(wage, unit: "R$", format: "%n %u")
  end

  def show_description(str, num)
    truncate(str, :lenght => num )
  end
end
