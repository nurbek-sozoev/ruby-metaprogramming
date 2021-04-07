module BlankStale
  def self.included(base)
    # BlankStale использует метод undef_method для удаления имеющихся методов
    base.class_eval do
      # Методы __send__ и __id__ необходимы для вызова других методов, поэтому их удалять нельзя
      methods = instance_methods - [:__send__, :__id__]
      methods.each { | m | undef_method m }
    end
  end
end

class SimpleObject; end

class BlankObject
  include BlankStale
end

puts SimpleObject.instance_methods
# dup
# itself
# yield_self
# ...

puts BlankObject.instance_methods
# __send__
# __id__
