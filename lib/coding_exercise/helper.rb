class String
  
  def to_hash(separ="\n", key_sep='=>')
    converted_array = self.split(separ)
    dict = {}
    converted_array.each do |u|
      value = u.gsub(' ','').split(key_sep)
      dict[value[0]]=value[1]
    end

    return dict
  end
end

def create_ordering dict
  items= dict.keys + dict.values 
  items=items.uniq - [nil]
  tree =[]
  dict.each do |k,v|
    # puts k,v,'aaaaadddddeee'
    if v.nil? or not items.include? v
      next
    else
      sol= search_values_for dict, k,v
      items = items - sol

      tree = tree + sol unless (sol - tree).empty?
    end
  end
  # print items,tree,'bbbbb'
  tree + items #.join
end  
        
def search_values_for dict,key,value
  ret=[key]
  raise 'The job cannot depend on themselves.' if key==value
  while dict.has_key? value
    ret << value
    value= dict[value]
  end
  ret.reverse
end




