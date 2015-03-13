class CreateMotivation < ActiveRecord::Migration
  def change
        create_table (:motivations) do |t|
          t.integer :motivator_id
          t.integer :follower_id

          t.timestamps
    end

  end
end
