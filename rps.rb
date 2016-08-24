VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'lizard' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Win!")
  elsif win?(computer, player)
    prompt("You Lose.")
  else
    prompt("The game is a tie.")
  end
end

prompt("Welcome to my game. First to five?")

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please make a valid choice.")
    end
  end

  computer_choice = ["rock", "paper", "scissors", "lizard", "spock"].sample()
  Kernel.puts("You chose #{choice}, and the computer chose #{computer_choice} ...")

  display_results(choice, computer_choice)

  prompt("Would you like to play again? Type 'y' to play again.")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase().start_with?('y')
end

prompt("Thanks for playing! :)")
