module InstanceCounter

  def self.included(class_name)
    class_name.extend ClassMethods
    class_name.send :include, InstanceMethods
  end

  module ClassMethods  
    attr_accessor :instances
  end

  module InstanceMethods    
    private  
    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end 

end

