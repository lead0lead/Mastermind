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
    return 'Wrong Code' unless checked_code_response.each { |i| i == 'Black' }

    'Correct Code!'
  end
end

game = Game.new(6, 4)

secret_code = game.generate_secret_code(game.color_amount, game.code_length)
p secret_code
guessed_code = game.make_guess
p guessed_code
checked_code_response = game.check_guess(guessed_code, secret_code)
p game.check_round_result(checked_code_response)
