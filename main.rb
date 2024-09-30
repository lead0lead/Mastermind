# frozen_string_literal: true

require_relative 'lib/computer_solver'
require_relative 'lib/game'

def play_game(color_amount, code_length, max_rounds, player_type)
  game = Game.new(color_amount, code_length, player_type)
  secret_code = game.generate_secret_code(game.color_amount, game.code_length) if player_type == 'human'
  secret_code = game.make_guess if player_type == 'computer'
  p secret_code
  1.upto(max_rounds) do |round|
    puts "Now playing round: #{round}"
    guessed_code = game.make_guess if player_type == 'human'
    guessed_code = game.generate_secret_code(game.color_amount, game.code_length) if player_type == 'computer'
    checked_code_response = game.check_guess(guessed_code, secret_code)
    return "Game Won! in round #{round}" if game.check_round_result(checked_code_response) == 'Correct Code!'

    puts "You made your guess: The response is: #{checked_code_response}"
  end
  "Game lost! The correct code was #{secret_code}"
end

computer_solver = ComputerSolver.new('placeholder', 6, 4)
p computer_solver.generate_possible_codes(6, 4)

puts 'Please enter player type: human or computer'
player_type = gets.chomp
p play_game(6, 4, 12, player_type)
