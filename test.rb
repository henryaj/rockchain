require_relative './blockchain'
require 'pp'

bc = Blockchain.new
block1 = Block.new(payload: "lorem ipsum dolor sit amet")
bc << block1

block2 = Block.new(payload: "are magnesium and scorn sufficient to support a town").mint(bc.last)
bc << block2

block3 = Block.new(payload: "not like the brazen giant of Greek fame").mint(bc.last)
bc << block3

pp bc
puts bc.valid?

# manipulate the chain so it becomes invalid
bc.chain[0] = Block.new(payload: "this is the new shit")
pp bc
puts bc.valid?

require_relative './blockchain-proof-of-work'

pow_bc = Blockchain.new
pow_block1 = PowBlock.new(payload: "lorem ipsum dolor sit amet").mine
pow_bc << pow_block1
pp pow_bc