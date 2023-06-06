class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])    
  end

end
