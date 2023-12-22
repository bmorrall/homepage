module BootstrapFlashHelper
  ALERT_TYPES = %w[danger info success warning]

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = "success" if type == "notice"
      type = "danger" if type == "alert"
      next unless ALERT_TYPES.include?(type)

      flash_messages << bootstrap_flash_tag(type, message)
    end
    flash_messages.join("\n").html_safe
  end

  def bootstrap_flash_tag(type, message)
    content_tag(:div, class: "alert fade in alert-#{type}") do
      concat content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert")
      concat message.html_safe
    end
  end
end
