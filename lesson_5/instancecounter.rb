module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      puts @instances
    end

    private

    def count_instances
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.send(:count_instances)
    end
  end
end
