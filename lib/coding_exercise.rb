class CodingExercise

  def self.parce_jobs job
    if job.length ==0
      job
    else
      ret=''
      rets = job.split("\n").each do |u|
        u.split(' =>').each do |j|
          ret << j
        end
      end
      ret
        # .join()


    end
  end
end