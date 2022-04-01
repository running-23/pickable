class RemoveNumberOfApplicantsFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :number_of_applicants, :integer
  end
end
