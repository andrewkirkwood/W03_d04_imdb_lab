require('pry')
require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

# Casting.delete_all()
# Movie.delete_all()
# Star.delete_all()

star1 = Star.new({ 'first_name' => 'Tom', 'last_name' => 'Hanks'})
star1.save()

binding.pry
nil
