module Validation

  def self.included(class_name)
    class_name.extend ClassMethods
    class_name.send :include, InstanceMethods
  end

  module ClassMethods

  attr_accessor :validations

  private

  def validate(attr_name, validation_type, param = nil)
    @validations ||= []
    @validations << { attr_name: attr_name, validation_type: validation_type, param: param }
  end

  end

  module InstanceMethods

    def valid?
      validate!
    rescue StandardError
      false
    end

    private 

    def validate! 
      self.class.validations ||= []  
      self.class.validations.each do |validation|
        send validation[:validation_type], instance_variable_get("@#{validation[:attr_name]}".to_sym), validation[:param]
      end
      true
    end

    def presence(attr, *param)
      raise ArgumentError, 'Пустой параметр' if attr.empty?
    end

    def format(attr, format)
      raise ArgumentError, 'Неверный формат' if attr !~ format
    end

    def type(attr, type)
      raise ArgumentError, 'Неверный тип' unless attr.is_a? type
    end
  
  end

end
