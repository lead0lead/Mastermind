# frozen_string_literal: true

color_amount = 6

code_length = 4

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

secret_code = generate_secret_code(color_amount, code_length)
p secret_code
guessed_code = make_guess
p guessed_code
p check_guess(guessed_code, secret_code)
