class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.datetime :start_from_date
      t.datetime :end_date
      t.integer :brand_id
      t.string :countries

      t.timestamps
    end
  end
end
