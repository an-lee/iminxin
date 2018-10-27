class CreateMxAppAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :mx_app_attachments do |t|
      t.references :mx_app, foreign_key: true
      t.string :file, comment: '文件'
      t.timestamps
    end
  end
end
