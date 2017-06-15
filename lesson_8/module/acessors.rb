module Acessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value| 
        instance_variable_set(var_name, value)
        attr = (var_name.to_s + "_history").to_sym
        attr_history = instance_variable_get(attr) || []
        instance_variable_set(attr, attr_history.push(value)) 
      end
      end
    end

    def strong_attr_acessor
    end
  end

  module InstanceMethods
    def some_history
    end
  end
end
