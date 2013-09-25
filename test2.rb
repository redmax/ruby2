class Test2
  include Enumerable

  attr_reader :name, :inner_obj

  def initialize(name, inner_obj)
    @name = name
    @inner_obj = inner_obj
  end

  def each
    obj = self
    loop do
      yield obj
      obj = obj.inner_obj
      break if obj.nil?
    end
  end
end

is_good = -> v { v.name == 'A0' || v.name == 'A2' || v.name == 'A3'}

a0 = Test2.new('A0', nil)
a1 = Test2.new('A1', a0)
a2 = Test2.new('A2', a1)
a3 = Test2.new('A3', a2)

a3
    .first(3)
    .select(&is_good)
    .each_with_index do |v,i|
      puts "#{"\t" * i}#{v.name}"
    end



puts
puts '***********************************'

st = <<-END
Line 1
Line 2
Line 3
Line 4
END

st.scan(/.+$/).each_with_index do |l, i|
  puts "#{"\t" * i}#{l}"
end
