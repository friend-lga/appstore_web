class AppsController < InheritedResources::Base
  before_action :prepare_data, on: :index

  private

    def app_params
      params.require(:app).permit(:id, :title, :description, :version, :icon, :package, :user_id, :category, :tags, :created_at, :updated_at)
    end

    def prepare_data
      category_id = params[:category_id]
      limit = params[:limit]
      @category = Category.find(category_id) if category_id.present?
      @title = @category&.title || params[:title] || 'Все приложения'
      @apps = App.order(Arel.sql('RANDOM()'))
      @apps = @apps.joins(:categories).where(categories: {id: @category.id}) if @category.present?
      @apps = @apps.limit(limit) if limit.present?
    end

end
