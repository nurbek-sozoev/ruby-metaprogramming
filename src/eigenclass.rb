john = "John"

# Конструкция `class <<` позволяет получить доступ к метаклассу объекта
class << john
  def hello
    "Hello, #{ self }!"
  end
end

puts john       # > John
puts john.hello # > Hello, John!
