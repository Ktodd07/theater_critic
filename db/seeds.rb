Review.destroy_all
Movie.destroy_all

puts "seeding database, please wait..."
@review = Review.create(title: "A Sci-fi classic!", movie: "Alien", review: "Very scary!")
@movie = Movie.create(title: "Alien", image: "https://images-na.ssl-images-amazon.com/images/I/41VReP3cJoL._AC_.jpg", description: "Alien is a 1979 science fiction horror film directed by Ridley Scott and written by Dan O'Bannon. Based on a story by O'Bannon and Ronald Shusett, it follows the crew of the commercial space tug Nostromo, who encounter the eponymous Alien, an aggressive and deadly extraterrestrial set loose on the ship.")
puts "finished."