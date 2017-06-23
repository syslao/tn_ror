module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :params

    def validate(attr, type, *args)
      @params ||= []
      @params << { attr: attr, type: type, args: args }
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue
      false
    end

  protected
    def validate!
      self.class.params.each do |param|
        attribute = instance_variable_get("@#{param[:attr]}".to_sym)
        send param[:type], attribute, param[:args].first
      end
      true
    end

    def presence(attribute, _args)
      raise 'Name cant be nil' if attribute.nil?
    end

    def format(attribute, regexp)
      raise 'object is different format' unless attribute =~ regexp
    end

    def type(attribute, clss)
      raise 'object is different class' unless attribute.is_a?(clss)
    end

    def quantity(attribute, value)
      raise 'quantity should be more than 0' if attribute < value
    end
  end
end
