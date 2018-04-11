module InstanceCounter

  def self.included(class_name)
    class_name.extend ClassMethods
    class_name.send :include, InstanceMethods
  end

  module ClassMethods   
    def instances     
      self.class_variable_get :@@instances
    end
  end

  module InstanceMethods    
    private  
    def register_instance
      instances = self.class.class_variable_get :@@instances 
      instances += 1
      self.class.class_variable_set :@@instances, instances
    end
  end 

end

