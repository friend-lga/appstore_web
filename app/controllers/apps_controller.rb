class AppsController < InheritedResources::Base

  private

    def app_params
      params.require(:app).permit(:id, :title, :description, :version, :icon, :package, :user_id, :category, :tags, :created_at, :updated_at)
    end

end
