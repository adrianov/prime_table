require 'singleton'

class MyPrime
  include Singleton
  @primes = [2]

  # Get first n primes
  def self.first(n)
    return nil if n < 1

    i = @primes.last
    while @primes.length < n
      i += 1
      next if i.even?

      root = Math.sqrt(i).floor
      is_prime = true
      @primes.each do |prime|
        is_prime = false if i % prime == 0
        break if !is_prime || prime > root
      end

      @primes << i if is_prime
    end
    @primes
  end
end

class MulTable
  def initialize(numbers)
    @numbers = numbers
    @width = (numbers.max ** 2).to_s.length
  end

  def to_s
    res = "| #{' ' * @width} | " + @numbers.map { |n| format_number(n) }.join(' | ') + " |\n"
    @numbers.each do |i|
      res += "| #{format_number(i)}"
      @numbers.each do |j|
        res += " | #{format_number(i * j)}"
      end
      res += " |\n"
    end
    res
  end

  private
    def format_number(number)
      sprintf "%#{@width}d", number
    end
end

n = ARGV[0].to_i
if n >= 1
  print MulTable.new(MyPrime.first(n))
end
