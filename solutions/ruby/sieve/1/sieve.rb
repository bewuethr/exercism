class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    sieve = (2..@n).map { |el| {n: el, composite: nil} }

    while (idx = sieve.find_index { |el| el[:composite].nil? })
      sieve[idx][:composite] = false
      (idx...sieve.length)
        .step(sieve[idx][:n])
        .drop(1)
        .each { |i| sieve[i][:composite] = true }
    end

    sieve.select { |el| !el[:composite] }.map { |el| el[:n] }
  end
end
