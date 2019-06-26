airbnb = StartUp.create!(target: "Holiday goers", solution: "Platform to rent someone's home in any city", pain: "Finding a comfy place to stay, not a hotel")
uber = StartUp.create!(target: "People", solution: "Platform to book a taxi in one click, without the hassle", pain: "Catching a taxi can be annoying and risky")


owner = User.create(name: "Irina")
game = Game.create!(code: "hello", user: owner)
owner.game = game
owner.save
round_one = Round.create!(start_up: airbnb, game: game)
round_two = Round.create!(start_up: uber, game: game)

player = User.create!(game: game, name: "Pepito")
