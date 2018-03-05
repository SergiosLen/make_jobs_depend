require 'coding_exercise/helper'

class CodingExercise

  def self.parce_jobs job
    if job.length ==0
      job
    else
      ret =job.to_hash
      tree =create_ordering ret 
      tree.join


    end
  end

end