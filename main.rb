# frozen_string_literal: true

require_relative 'lib/game'

def play_game(color_amount, code_length, max_rounds)
  game = Game.new(color_amount, code_length)
  secret_code = game.generate_secret_code(game.color_amount, game.code_length)
  p secret_code
  1.upto(max_rounds) do |round|
    puts "Now playing round: #{round}"
    guessed_code = game.make_guess
    checked_code_response = game.check_guess(guessed_code, secret_code)
    return "Game Won! in round #{round}" if game.check_round_result(checked_code_response) == 'Correct Code!'

    puts "You made your guess: The response is: #{checked_code_response}"
  end
  "Game lost! The correct code was #{secret_code}"
end

p play_game(6, 4, 12)
