require 'prime'
MAX_VAL = 10**6

class Integer

  def myIsPrime?
    false if self%2 == 0
    (3..Math.sqrt(self)).step(2) do |p|
      return false if self % p == 0
    end
    true
  end
end

#uso della funzione interna
start = Time.now
p (3..MAX_VAL).step(2)
  .select  { |v| v.myIsPrime? }
  .count
p Time.now - start

#uso della classe Prime secondo approccio standard
start = Time.now
p (3..MAX_VAL).step(2)
  .select  { |v| Prime.prime?(v) }
  .count
p Time.now - start

#uso del metodo take_while della classe Prime
start = Time.now
p Prime.take_while { |v| v < MAX_VAL }.count
p Time.now - start
