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