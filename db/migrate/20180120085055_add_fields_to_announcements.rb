class AddFieldsToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :deleted, :integer, default: false
    add_column :announcements, :font_size, :integer, default: 10
    add_column :announcements, :bg_color, :string, default: '#f7d71e'
  end
end
