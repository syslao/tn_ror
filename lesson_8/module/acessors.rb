module Acessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      attr = "#{var_name}_history".to_sym # просто сохранил в переменную для краткости и переспользования
      attr_history = instance_variable_get(attr) || [] # при первом использовании создается массив, если такой инстанс переменной нет.
      define_method("#{name}_history") { instance_variable_get(attr) }
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=") do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(attr, attr_history.push(value))
      end
    end
  end

  def strong_attr_acessor(name, klass)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Object Class and given Class not equal' if value.class != klass
      instance_variable_set(var_name, value)
    end
  end
end
