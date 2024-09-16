# frozen_string_literal: true

color_amount = 6

code_length = 4

def generate_secret_code(color_amount, code_length)
  secret_code = []
  1.upto(code_length) do
    secret_code.push(rand(color_amount) + 1)
  end
  secret_code
end

def make_guess(secret_code, guessed_code)
  if guessed_code.split("").each { |i| i.to_i > 0 && i.to_i <= 6}
    'Valid Input'
  else
    'Invalid Input'
  end
end

puts 'pleaser enter code'
guessed_code = gets
secret_code = generate_secret_code(color_amount, code_length)

guess = make_guess(secret_code, guessed_code)

puts secret_code.join
puts guess
