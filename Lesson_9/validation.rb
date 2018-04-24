module Validation

   def self.included(class_name)
    class_name.extend ClassMethods
    class_name.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(name, type, *attr)
      case type
      when :presence
        return false if name.to_s.empty?
      when :format
        return false if name !~ attr[0]
      when :type
        return false unless name.is_a? attr[0]
      end
      true
    end

  end

  module InstanceMethods
    private 

      def validate!        
        case self  
        when Train
          name = self.number
          type = String
          format = /\w{3}-{1}*\w{2}/i
        when Station
          name = self.name
          type = String
          format = /[а-я\w]/i
        when Route
          name = self.stations.first          
          type = Station
          format = /A[а-я\w]/i
        end        
        raise ArgumentError, 'Атрибут не указан'  unless self.class.validate name, :presence  
        raise ArgumentError, 'Не верный формат'   unless self.class.validate name, :format, format unless self.is_a? Route
        raise ArgumentError, 'Не верный тип'      unless self.class.validate name, :type, type      
        true
      end

      def valid?
        validate!
      rescue StandardError
        false
      end

    end

end
