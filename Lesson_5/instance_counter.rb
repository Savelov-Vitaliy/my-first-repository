module InstanceCounter

  def self.included(class_name)
    class_name.extend ClassMethods
    class_name.send :include, InstanceMethods
  end

  module ClassMethods  

    def instances_counter
      @instances_number ||= 0
      @instances_number += 1
    end

    def instances     
      @instances_number
    end   
  end

  module InstanceMethods    
    private  
    def register_instance
      self.class.instances_counter
    end
  end 

end

