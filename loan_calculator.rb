=begin

Can't quite get it working properly. I keep getting a divide by 0 error. Something isn't working on the .to_i/.to_f I imagine.
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("How much would you like borrow for this mortgage?")
user_loan_amount = ''
loop do
  user_loan_amount = Kernel.gets().chomp()
  if user_loan_amount.empty?() || user_loan_amount.to_f() <= 0
    prompt("Please input a number greater than 0.")
  else
    break
  end
end


prompt("What is the APR that you've been pre-approved for?")
user_apr = ''
loop do
  user_apr = Kernel.gets().chomp()
  if user_apr.empty? || user_apr.to_f <= 0
    prompt("Please plug in a number greater than 0.")
  else
    break
  end
end

user_apr_decimal = user_apr.to_f / 100
user_apr_monthly = user_apr_decimal.to_f / 12

prompt("How many months will this loan be for?")
user_loan_duration_months = ''
loop do
  user_loan_duration_months = Kernel.gets().chomp()
  if user_loan_duration_months.empty? || user_loan_duration_months.to_i <= 0
    prompt("Please type in a number larger than 0.")
  else
    break
  end
end

prompt("Ok, so you're taking out a $#{user_loan_amount} loan with a #{user_apr}% rate for #{user_loan_duration_months} months.")
prompt("Calculating loan information ...")

monthly_payment = user_loan_amount.to_f() * (user_apr_monthly / (1 - (1 + user_apr_monthly)**-user_loan_duration_months.to_i))

prompt("Your monthly payment will be: " + monthly_payment + " for #{user_loan_duration_months} months.")

prompt("Calculate another? (Type 'Yes' to go again)")
calc_another = Kernel.gets().chomp()

