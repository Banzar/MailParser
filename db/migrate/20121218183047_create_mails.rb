class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.integer :id
      t.text :message

      t.timestamps
    end
  end
end
