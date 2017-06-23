module Acessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      attr = (var_name.to_s + '_history').to_sym
      attr_history = instance_variable_get(attr) || []
      define_method((name + '_history').to_sym) { instance_variable_get(attr) }
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(attr, attr_history.push(value))
      end
    end
  end

  def strong_attr_acessor(name, cls)
    var_name = "@#{name}".to_sym
    attr_class = Module.const_get(cls)
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      instance_variable_set("@#{name}_class".to_sym, attr_class)
      raise 'Object Class and given Class not equal' if value.class != attr_class
      instance_variable_set(var_name, value)
    end
  end
end
