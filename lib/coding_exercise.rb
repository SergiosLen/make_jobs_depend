require 'coding_exercise/helper'

class CodingExercise

  def self.parce_jobs job
    if job.length ==0
      job
    else
      ret =job.to_hash
      counter=Hash.new(0)
      ret.each do |k,v|
        counter[v]+=1
        counter[k]+=1
      end
      # p counter
      # ss=''
      tree=[]
      counter.sort_by {|_key,value| value}.reverse.each do |k,v|
        tree << k unless k.nil?
        # puts k,v
        while not ret[k].nil?
          tree << ret[k] unless tree.include?(ret[k])
          k=ret[k]
        end
        # print tree,'aaa'
      end
      tree.join

      # rets = job.split("\n").each do |u|
      #   u.split(' =>').each do |j|
      #     ret << j
      #   end
      # end
      # ret
        # .join()


    end
  end
end