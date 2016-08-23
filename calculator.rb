=begin

comp ask - what is first number
user type - 1st number
comp ask - what is 2nd number
user type - 2nd number
comp ask - what would you like to do with these 2 numbs
  add sub mult div?
user answer
comp calculate
comp return answer

=end
require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

ans1 = ''

prompt(MESSAGES['english']['welcome'])
user_name = ''

loop do
  user_name = Kernel.gets().chomp()
  if user_name.empty?()
    prompt("C'mon, I know you have a name. What is it? :)")
  else
    break
  end
end

prompt("Hello there #{user_name}.")

loop do
  loop do
    prompt("What is the first number you would like to choose?")
    ans1 = Kernel.gets().chomp

    if valid_number?(ans1)
      break
    else
      prompt("Hmm ... please make sure you've entered a vaild number.")
    end
  end

  prompt("Your first number: " + ans1)

  ans2 = ''
  loop do
    prompt("What is the second number you would like to choose?")
    ans2 = Kernel.gets().chomp

    if valid_number?(ans2)
      break
    else
      prompt("Hmm ... please make sure you've entered a vaild number.")
    end
  end

  prompt("Your second number: " + ans2)
  prompt(ans1 + " " + ans2)

  operation_prompt = <<-OPP
What operation would you like to perform? Choose a number:
  1) Add
  2) Subtract
  3) Multiply
  4) Divide
  OPP

  prompt(operation_prompt)
  operation = ''

  loop do
    operation = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Sorry, you must choose 1, 2, 3, or 4.")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers ... ")

  result = case operation
           when '1'
             ans1.to_i() + ans2.to_i()
           when '2'
             ans1.to_i() - ans2.to_i()
           when '3'
             ans1.to_i() * ans2.to_i()
           when '4'
             ans1.to_f() / ans2.to_f()
           end

  prompt("Your answer is #{result}")

  prompt("Make another calculation? Type 'Y' to keep calculating.")
  calc_again = Kernel.gets().chomp()
  break unless calc_again.downcase().start_with?('y')
end

prompt(MESSAGES['espanol']['goodbye'])
