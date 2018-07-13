require 'digest'

class Block
  attr_reader :payload, :hash_previous
  
  def initialize(args)
    @payload = args.fetch(:payload)
    @hash_previous = nil # hash of the previous block in the chain
  end

  # mint a block to go on the end of a chain
  def mint(previous_block)
    @hash_previous = previous_block.calculate_hash
    self
  end
  
  def calculate_hash
    Digest::SHA256.hexdigest(payload)
  end
end

class Blockchain
  attr_accessor :chain

  def initialize
    @chain = Array.new
  end

  def <<(block)
    @chain << block
  end
  alias push <<

  def last
    @chain.last
  end

  def first
    @chain.first
  end

  def valid?
    @chain.each_with_index do |block, i|
      next if i == 0 # we're assuming the genesis block is valid
      return false unless block.hash_previous == @chain[i-1].calculate_hash
    end

    return true
  end
end