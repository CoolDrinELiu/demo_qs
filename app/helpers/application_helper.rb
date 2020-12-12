module ApplicationHelper
  def active_menu(controllers, options = {})
    class_name = options.fetch(:value, 'active')
    actions = options.fetch(:actions, [])

    controllers.map! { |c| File.join(options[:namespace], c) } if options[:namespace] and options[:namespace].is_a?(String)
    return class_name if controllers.include?(params[:controller]) && actions.include?(params[:action])
    return class_name if controllers.include?(params[:controller]) && actions.blank?
    return nil
  end

  def bootstrap_flash(options = {})
    alert_types = [:success, :info, :warning, :danger]
    flash_messages = []
    flash_msg = flash
    flash_msg = @msg if @msg.present?
    flash_msg.each do |type, message|
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless alert_types.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert fade in alert-#{type} #{tag_class}"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"), type: 'button', class: 'close', 'data-dismiss' => 'alert')

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options)
        flash_messages << text
      end
    end
    flash_messages.join("\n").html_safe
  end
end
