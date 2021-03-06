class ExceptionsController < ApplicationController
  skip_before_filter :check_xhr
  skip_before_filter :check_restricted_access
  layout 'no_js'

  def not_found
    f = Topic.where(deleted_at: nil, archetype: "regular")

    @popular = f.order('views desc').take(10)
    @recent = f.order('created_at desc').take(10)
    @slug =  params[:slug].class == String ? params[:slug] : ''
    @slug.gsub!('-',' ')
    render status: 404
  end
end
