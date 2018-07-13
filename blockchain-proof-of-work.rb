require_relative './blockchain.rb'

DIFFICULTY = 5

class PowBlock < Block
  attr_reader :nonce

  def initialize(args)
    @nonce = 0
    super
  end

  def mine
    puts "Mining started."
    counter = 0

    loop do
      counter += 1
      puts ":: Iteration #{counter}" if counter % 100 == 0
      increment_nonce!
      h = calculate_hash
      break if h.start_with?("0" * DIFFICULTY)
    end
    
    puts "Block mined."
    
    return self
  end

  def increment_nonce!
    self.nonce += 1
  end

  def calculate_hash
    Digest::SHA256.hexdigest(payload + nonce.to_s(16))
  end

  private
  attr_writer :nonce
end