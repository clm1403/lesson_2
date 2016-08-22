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

Kernel.puts("Welcome to the calculator program.")
Kernel.puts("What is the first number you would like to choose?")
ans1 = Kernel.gets().chomp

Kernel.puts("Your first number: " + ans1)

Kernel.puts("What is the second number you would like to choose?")
ans2 = Kernel.gets().chomp

Kernel.puts("Your second number: " + ans2)
Kernel.puts(ans1 + " " + ans2)
Kernel.puts("What operation would you like to perform? Choose a number: 1) add 2) subtract 3) multiply 4) divide")
operation = Kernel.gets().chomp()

if operation == '1'
  result = ans1.to_i() + ans2.to_i()
elsif operation == '2'
  result = ans1.to_i() - ans2.to_i()
elsif operation == '3'
  result = ans1.to_i() * ans2.to_i()
else operation == '4'
  result = ans1.to_f() / ans2.to_f()
end
    
Kernel.puts("Your answer is #{result}")