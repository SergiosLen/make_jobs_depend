require 'coding_exercise/helper'

class CodingExercise
  # Value jobs depending their dependencies
  # 
  # Example:
  # >> CodingExercise.parce_jobs("a =>
  #                           b => c
  #                           c =>")
  #                           
  # Arguments:
  #   a string containing jobs as a character and separated with the sympol "=>"

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