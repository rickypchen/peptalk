QUOTES = ["Strive not to be a success, but rather to be of value", "Doubt whom you will, but never yourself", "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference", "You miss 100% of the shots you don’t take", "Eighty percent of success is showing up", "Your time is limited, so don’t waste it living someone else’s life", "Every child is an artist.  The problem is how to remain an artist once he grows up"]
AUTHORS = ["Albert Einstein", "Christian Nestell Bovee", "Robert Frost", "Wayne Gretzky", "Woody Allen", "Steve Jobs", "Pablo Picasso"]

quotes = Hash[AUTHORS.zip(QUOTES)]

quotes.each{ |author, quote| Quote.create(author: author, quote: quote, user_id: 5) }
