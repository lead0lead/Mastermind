# frozen_string_literal: true

# Tries to solve the secret code algorhytmically
class ComputerSolver
  attr_accessor :first_guess

  def initialize(checked_game_response, color_amount, code_length)
    @checked_game_response = checked_game_response
    @color_amount = color_amount
    @code_length = code_length
    @first_guess = true
  end

  def generate_possible_codes(color_amount, code_length)
    possible_codes = []
    1.upto(color_amount) do |color|
      possible_codes.push(Array.new(1, color))
    end
    1.upto(code_length - 1) do
      temp_codes = []
      possible_codes.each do |i|
        1.upto(color_amount) do |j|
          code = i + [j]
          temp_codes.push(code)
        end
        possible_codes = temp_codes
      end
    end
    possible_codes
  end
end
