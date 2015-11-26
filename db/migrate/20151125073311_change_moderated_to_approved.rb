class ChangeModeratedToApproved < ActiveRecord::Migration
  def change
    change_table(:posts) do |t|
      t.rename :moderated, :approved
    end
  end
end
