# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :postcode, :integer
    add_column :users, :address, :string
    add_column :users, :introduction, :text
  end
end
