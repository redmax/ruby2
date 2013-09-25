class MyClass
  def []=(*params, value)
    #p params
    #p value = params.pop
    puts "Indexed with: #{params.join(', ')}"
    puts "Value: #{value}"
  end

end

m = MyClass.new
m[1]=2
m['a','b']='x$x'

y=99
x=99
(1..10).each do |x|
  y = x + 1
end

puts "x=#{x}, y=#{y}"