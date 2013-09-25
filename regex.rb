#File.foreach(ARGV[0]).with_index do |line, indx|
#  puts "#{indx}: #{line}" if line =~ /def/
#end

def show_regexp(str, pattern) Regexp
  match = pattern.match(str)
  if match
    "#{match.pre_match} ->#{match[0]}<- #{match.post_match}"
  else
    "--- NO MATCH ---"
  end
end

def h_regexp(str, pattern)
  match = str.gsub(pattern, '*s')
  if match
    puts str
    puts match
  else
    "--- NO MATCH ---"
  end
end


/(?<hour>\d\d):(?<minute>\d\d)(..)/ =~ "12:50.12am"
puts "Hour is #{hour}, minutes is #{minute}"