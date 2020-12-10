module ApplicationHelper
  def active_menu(controllers, options = {})
    class_name = options.fetch(:value, 'active')
    actions = options.fetch(:actions, [])

    controllers.map! { |c| File.join(options[:namespace], c) } if options[:namespace] and options[:namespace].is_a?(String)
    return class_name if controllers.include?(params[:controller]) && actions.include?(params[:action])
    return class_name if controllers.include?(params[:controller]) && actions.blank?
    return nil
  end
end
