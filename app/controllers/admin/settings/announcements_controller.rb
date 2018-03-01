class Admin::Settings::AnnouncementsController < Admin::Settings::BaseController
  def index
    @announcements = Announcement.all
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(allowed_params)
    @announcement.errors.add(:base, 'please add message') if allowed_params[:message].blank?
    if @announcement.errors.size == 0 && @announcement.save
      flash[:notice] = "Successfully created announcement."
      redirect_to admin_settings_announcement_url(@announcement)
    else
      render :action => 'new'
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated Announcement."
      redirect_to admin_settings_announcement_url(@announcement)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.update_attributes(
      deleted: true,
      deleted_at: Time.zone.now
    )
    flash[:notice] = "Successfully archived announcement."
    redirect_to admin_settings_announcements_url
  end

  private

  def allowed_params
    params.require(:announcement).permit(:message, :starts_at, :ends_at, :font_size, :bg_color, :color)
  end
end
