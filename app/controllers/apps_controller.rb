class AppsController < InheritedResources::Base
  before_action :prepare_title, on: :index

  private

    def app_params
      params.require(:app).permit(:id, :title, :description, :version, :icon, :package, :user_id, :category, :tags, :created_at, :updated_at)
    end

    def prepare_title
      @title = params[:title] || 'Все приложения'
    end

end
