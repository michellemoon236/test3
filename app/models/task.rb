class Task < ApplicationRecord
  belongs_to :project
  scope :completed, -> { where(complete: true) }
  scope :not_completed, -> { where(complete: false) }
end


# create_table :tasks do |t|
#   t.integer :project_id
#   t.string :content
#   t.boolean :complete, default: false

#   t.timestamps