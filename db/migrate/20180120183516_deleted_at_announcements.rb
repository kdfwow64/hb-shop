class DeletedAtAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :color, :string, default: '#1d1d1d'
    add_column :announcements, :deleted_at, :datetime
  end
end
