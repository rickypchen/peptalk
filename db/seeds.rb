QUOTES = ["Strive not to be a success, but rather to be of value", "Doubt whom you will, but never yourself", "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference", "You miss 100% of the shots you don’t take", "Eighty percent of success is showing up", "Your time is limited, so don’t waste it living someone else’s life", "Every child is an artist.  The problem is how to remain an artist once he grows up", "Go confidently in the direction of your dreams.  Live the life you have imagined", "Life is not measured by the number of breaths we take, but by the moments that take our breath away"]
AUTHORS = ["Albert Einstein", "Christian Nestell Bovee", "Robert Frost", "Wayne Gretzky", "Woody Allen", "Steve Jobs", "Pablo Picasso", "Henry David Thoreau", "Maya Angelou"]

USERS = [
  {username: "JeanPoole", first_name: "Jean", last_name: "Poole", password: "password"},
  {username: "EdwardSnooden", first_name: "Edward", last_name: "Snooden", password: "password"},
  {username: "AboveWind", first_name: "Above", last_name: "Wind", password: "password"},
  {username: "franksinatra", first_name: "Frank", last_name: "Sinatra", password: "password"},
  {username: "inedibleflamingo", first_name: "Flaming", last_name: "Ed", password: "password"},
  {username: "growthpains", first_name: "Peter", last_name: "Piper", password: "password"},
  {username: "chucknorris", first_name: "Chuck", last_name: "Norris", password: "password"},
]

quotes = Hash[AUTHORS.zip(QUOTES)]

quotes.each do |author, quote|
  Quote.create(author: author, quote: quote, user_id: rand(1..7))
end

USERS.each do |user|
  User.create(username: user[:username], first_name: user[:first_name], last_name: user[:last_name], password: user[:password])
end