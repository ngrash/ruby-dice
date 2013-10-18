$LOAD_PATH << '..\lib'

require 'dices'

# Roll six dices with 20 sides each and print the result
p 6.dices(1..20).roll