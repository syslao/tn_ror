def fib(n)
  n <= 2 ? 1 : fib(n - 1) + fib(n - 2)
end

i = 1
loop do
  num = fib(i)
  i += 1
  break if num > 100
  puts num
end
