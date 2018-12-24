class AddIntroToCircleAppSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :circle_app_settings, :introduction, :text, comment: '介绍'
  end
end
