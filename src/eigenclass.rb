# Конструкция `class <<` позволяет получить доступ к метаклассу объекта

class SomeClass
  def hi
    puts "Hi!"
  end
end

# Eigenclass класса SomeClass
class << SomeClass
  def hello
    puts "Hello!"
  end
end

class OtherClass < SomeClass; end

other_var = OtherClass.new
some_var = SomeClass.new

# Eigenclass переменной some_var (instance класса SomeClass)
class << some_var
  def bye
    puts "Bye!"
  end
end

some_var.hi    # > Hi!
some_var.bye   # > Bye!
# some_var.hello # Ошибка, нет такого метода

other_var.hi    # > Hi!
# other_var.bye   # Ошибка, нет такого метода
# other_var.hello # Ошибка, нет такого метода

SomeClass.hello  # > Hello!
OtherClass.hello # > Hello!
