class Admin::Users::SessionsController < Devise::SessionsController
  layout 'admin/sessions'
  #skip_before_action :all_products
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    admin_root_path
  end

  def after_sign_up_path_for(resource)
    admin_root_path
  end
  private

  # def require_no_authentication
  #   assert_is_devise_resource!
  #   return unless is_navigational_format?
  #   no_input = devise_mapping.no_input_strategies

  #   authenticated = if no_input.present?
  #     args = no_input.dup.push scope: resource_name
  #     warden.authenticate?(*args)
  #   else
  #     warden.authenticated?(resource_name)
  #   end

  #   if authenticated && resource = warden.user(resource_name)
  #     flash[:notice] = I18n.t("devise.failure.already_authenticated")
  #     redirect_to admin_kpis_path
  #   end
  # end
end
