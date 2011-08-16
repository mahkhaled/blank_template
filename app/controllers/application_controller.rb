class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  helper_method :sort_column, :sort_direction
  
#  before_filter :set_locale
 
  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  # def default_url_options(options={})
  #   if I18n.locale != I18n.default_locale
  #     { :locale => I18n.locale } 
  #   else
  #     {}
  #     { :locale => I18n.locale }
  #   end
  # end
  
  def sort_options
    sort_column + ' ' + sort_direction
  end
  
  def sort_column
    eval(model_name.classify).column_names.include?(params[:sort]) ? params[:sort] :  eval(model_name.classify).column_names[1]
  end
  
  # moved to application controller
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
