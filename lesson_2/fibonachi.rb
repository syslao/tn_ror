digit = 0
until digit > 100 do
  n <= 2 ? 1 : fib(n - 1) + fib(n - 2)
end

def fib(n)
  n <= 2 ? 1 : fib(n - 1) + fib(n - 2)
end

p (1..20).map {|i| fib(i)}


i = 1
loop do
  i += 2
  puts i
  if i == 10
    break
  end
end
