class BaseService
  include Callable
  
  class Success < OpenStruct
    def success?
      true
    end
    
    def errors
    end
  end
  
  class Failure < OpenStruct
    def success?
      false
    end
  end


  private
  
  def attributes(base_params)
    base_params.dig(:data, :attributes)
  end
  
  def relationships
    params.dig(:data, :relationships)
  end
  
  def inclusions
    params.dig(:included)
  end
  
end