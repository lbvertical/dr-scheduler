class AddPhoneNumberToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :phone_number, :string
  end
end
