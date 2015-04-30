require './prime_table'

RSpec.describe MyPrime do
  describe '#first' do
    let(:primes) { MyPrime.first(100) }
    it 'starts with 2' do
      expect(primes[0]).to eq(2)
    end
    it 'is 541 for 100th' do
      expect(primes[99]).to eq(541)
    end
    it 'is monotonically increasing' do
      for i in 1..(primes.length - 1)
        expect(primes[i]).to be > primes[i - 1]
      end
    end
  end
end

RSpec.describe MulTable do
  describe '#to_s' do
    it 'creates correct table' do
      expect(MulTable.new([2]).to_s).to eq(
<<Q
|   | 2 |
| 2 | 4 |
Q
      )
      expect(MulTable.new([2, 3, 5, 7, 11]).to_s).to eq(
<<Q
|    |   2 |   3 |   5 |   7 |  11 |
|  2 |   4 |   6 |  10 |  14 |  22 |
|  3 |   6 |   9 |  15 |  21 |  33 |
|  5 |  10 |  15 |  25 |  35 |  55 |
|  7 |  14 |  21 |  35 |  49 |  77 |
| 11 |  22 |  33 |  55 |  77 | 121 |
Q
      )
    end
  end
end
