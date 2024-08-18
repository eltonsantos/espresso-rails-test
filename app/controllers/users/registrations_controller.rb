class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, if: :devise_controller?

  def new
    build_resource({})
    resource.build_company
    respond_with self.resource
  end
  
  def create
    build_resource(sign_up_params)
    resource.role = 0
    if resource.save
      sign_up(resource_name, resource)
      redirect_to root_path, notice: 'Cadastro realizado com sucesso.'
    end
  end

  protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, company_attributes: [:name, :cnpj]])
    end

end
