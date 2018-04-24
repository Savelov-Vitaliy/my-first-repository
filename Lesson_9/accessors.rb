module Accessors

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_history = "@#{name}_history".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history".to_sym) { instance_variable_get(var_name_history) }
      define_method("#{name}=".to_sym) do |value| 
        history = instance_variable_get(var_name_history) 
        history ||= []
        old_value = history.last
        instance_variable_set(var_name_history, history << value) unless old_value == value
        instance_variable_set(var_name, value)         
      end
    end
  end

  def strong_attr_acessor(name, class_name)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|  
      raise ArgumentError, "Ошибка: значения должно быть типа " + class_name.to_s unless value.is_a? class_name
      instance_variable_set(var_name, value)  
    end 
  end

end