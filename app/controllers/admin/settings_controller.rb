class Admin::SettingsController < Admin::ApplicationController
  # GET /admin/settings
  # GET /admin/settings.json
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # POST /admin/settings
  # POST /admin/settings.json
  def create
    puts settings_params
    
    settings_params.each do |param, value|
      Settings[param] = value
    end

    respond_to do |format|
      format.html { redirect_to admin_settings_path, notice: t('notices.admin.settings.create') }
      format.json { render json: settings_params, status: :created, location: admin_settings_url }
    end
  end

  protected

  def settings_params
    @settings_params ||= params['settings'].reject { |p| !%w(analytics_account).include?(p) }
  end

end
