module Admin::ApplicationHelper

  def alert_class(alert_type)
    if alert_type == :notice
      'alert-success'
    else
      "alert-#{alert_type.to_s}"
    end
  end

end
