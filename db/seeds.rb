Answer.destroy_all
StartUp.destroy_all
Round.destroy_all

airbnb = StartUp.create!(
  company: "Airbnb",
  target: "Holiday goers",
  solution: "Platform to rent someone's home in any city",
  pain: "Finding a comfy place to stay, not a hotel")
uber = StartUp.create!(
  company: "Uber",
  target: "People",
  solution: "Platform to book a taxi in one click, without the hassle",
  pain: "Catching a taxi can be annoying and risky")
lewagon = StartUp.create!(
  company: "Le Wagon",
  target: "People who have never coded before",
  solution: "Coding bootcamp in nine weeks to change your life",
  pain: "Not having the skills necessary to build your idea")
deliveroo = StartUp.create!(
  company: "Deliveroo",
  target: "Hungry, lazy people",
  solution: "Resteraunt food delivered direct to your home",
  pain: "Wanting restaurant quality food at home")
slack = StartUp.create!(
  company: "Slack",
  target: "Professionals",
  solution: "A platform to chat with colleagues in private messages and group chats",
  pain: "No professional place to chat with colleagues")
trello = StartUp.create!(
  company: "Trello",
  target: "Agile Teams",
  solution: "A platform to upload and manage tasks",
  pain: "No centralised place to organise tasks for a projects")



owner = User.create(name: "Irina")
game = Game.create!(code: "hello", user: owner)
owner.game = game
owner.save
round_one = Round.create!(start_up: airbnb, game: game)
round_two = Round.create!(start_up: uber, game: game)

player = User.create!(game: game, name: "Pepito")
