#!/usr/bin/env ruby

def word_from_string(s)
  s.downcase.scan(/[\w']+/)
end
def count_frequency(words)
  counts = Hash.new(0)
  for word in words
    counts[word] += 1
  end
  counts
end
def file_analize(f)
  raw_text = File.read(f)
  words = word_from_string(raw_text)

  counts = count_frequency(words)
  sorted = counts.sort_by {|word, count| count}
  top_five = sorted.last(5)
  top_five.each {|word, count| puts "#{word}: #{count}"}
end

def triangular_generator
  enum = Enumerator.new do |yielder|
    number, count = 0, 1
    loop do
      number += count
      count += 1
      yielder.yield number
    end
  end
  #per essere chiari ricordiamoci che funziona perché restituisce l'enumerator creato...
end

def enum_filter(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield value if block.call(value)
    end
  end
end

class Enumerator
  def enum_filer(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        yielder.yield value if block.call(value)
      end
    end
  end
end

def prova_enumerator_01
  p triangular_generator.lazy.each {|v| p v }

  p triangular_generator
    .enum_filer {|v| v % 10 == 0}
    .enum_filer {|v| v.to_s =~ /3/ }
    .first(5)

  p enum_filter(triangular_generator) {|v| v % 10 == 0}.first(5)
  p enum_filter(enum_filter(triangular_generator) {|v| v % 13 == 0}) { |v| v.to_s =~ /3/ }.first(5)

  p triangular_generator.first(5)
  p triangular_generator.first(5)
  puts

  p %w[foo bar baz].map.with_index { |w, i| "#{i}:#{w}" }
  %w[foo bar baz].each.with_index { |w, i| p"#{i}:#{w}" }
end

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1) }
  end.lazy
end


def palindrome?(n)
  sn = n.to_s
  sn == sn.reverse
end

def zz(&b)
  b
end


p Integer.all.first(10)
p Integer.all.first(10)

multiple_of_3 = -> i {(i%3).zero?}
#multiple_of_3 =  zz {|i| (i%3).zero?}

p Integer
    .all
    .select(&multiple_of_3)
    .select {|i| palindrome?(i)}
    .first(10)
    .each.with_index
    .select {|v, i| v if i >= 5}
    .map { |v| v[0]}


def k(x)
  x =  nil
end

next_int =  (-> i:0 { ->  { i += 1 } }).call



p next_int.call
p next_int.call
k(next_int)
p next_int.call

v=5
p p1 = -> n {v * n}
p p1.call(5)
v = 20
p p1.call(5)

