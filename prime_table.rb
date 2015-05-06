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
    max = numbers.max
    @widths = [max.to_s.length]
    numbers.each do |n|
      @widths << (max * n).to_s.length
    end
  end

  def to_s
    res = format_table_row([nil] + @numbers)
    @numbers.each do |number|
      res += format_table_row([number] + @numbers.map { |n| n * number })
    end
    res
  end

  private
    def format_table_row(values)
      res = '|'
      values.each_with_index do |v, k|
        res += ' ' + format_number(v, @widths[k]) + ' |'
      end
      res + "\n"
    end

    def format_number(number, width)
      return ' ' * width unless number
      sprintf "%#{width}d", number
    end
end

n = ARGV[0].to_i
if n >= 1
  print MulTable.new(MyPrime.first(n))
end
