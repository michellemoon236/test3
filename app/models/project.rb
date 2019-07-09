class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['content'].blank? }

  def tasks_attributes=(tasks)
    binding.pry
    tasks.each do |t|
      if t[1][:content] != ""
        task = Task.find_or_create_by(content: t[1][:content])
        self.tasks << task
        self.save
      end
    end
  end

end
