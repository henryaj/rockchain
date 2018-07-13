default:
	ruby test.rb

watch:
	ag -l | entr ruby test.rb
