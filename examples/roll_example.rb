$LOAD_PATH << '..\lib'

require 'dice'

# Roll six dice with 20 sides each and print the result
p 6.dice(1..20).roll
