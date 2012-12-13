module ApplicationHelper

  def body_class
    classes = [
      params[:controller],
      "#{params[:controller]}_#{params[:action]}"
    ]
    classes << "#{params[:controller]}_#{[params[:id]]}" unless params[:id].blank?
    classes.join(' ').gsub('/', '_')
  end

end
