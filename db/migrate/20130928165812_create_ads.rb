class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.belongs_to :advertiser
      t.integer :ad_type, :limit => 2
      t.integer :price
      t.string :address
      t.string :city
      t.string :bull1, :bull2, :bull3, :bull4, :mls, :agent, :agent_phone, :agent_email, :sms_phone, :sms_code
      t.date :when_run
      t.boolean :approved, :default => false
    end
  end
end
