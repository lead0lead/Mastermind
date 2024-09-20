# frozen_string_literal: true

# Responsible for all game logic
class Game
  attr_reader :color_amount, :code_length

  def initialize(color_amount, code_length)
    @color_amount = color_amount
    @code_length = code_length
  end

  def generate_secret_code(color_amount, code_length)
    secret_code = []
    1.upto(code_length) do
      secret_code.push((rand(color_amount) + 1).to_s)
    end
    secret_code
  end

  def make_guess
    puts 'Please Enter a Code in the following format: 1234'
    gets.chomp.split('')
  end

  def check_guess(guessed_code, secret_code)
    response = []
    guessed_code.each_with_index do |value, index|
      if secret_code.include?(value) && secret_code[index] == value
        response.push('Black')
      elsif secret_code.include?(value) && secret_code[index] != value
        response.push('White')
      else
        response.push('Empty')
      end
    end
    response.shuffle
  end

  def check_round_result(checked_code_response)
    return 'Wrong Code' unless checked_code_response.uniq.size == 1

    'Correct Code!'
  end
end

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
