# frozen_string_literal: true

module Admin
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, if: :devise_controller?

    def new
      build_resource({})
      resource.build_company
      respond_with resource
    end

    def create
      build_resource(sign_up_params)
      resource.role = 0
      return unless resource.save

      sign_up(resource_name, resource)
      redirect_to root_path, notice: I18n.t('admin.create.success')
    end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, { company_attributes: %i[name cnpj] }])
    end
  end
end
