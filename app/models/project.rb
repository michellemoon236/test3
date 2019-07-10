class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['content'].blank? }

  def tasks_attributes=(tasks)
    tasks.each do |t|
      if t[1][:content] != ""
        if Task.find_by(id: t[1][:id]) 
          task = Task.find_by(id: t[1][:id])
          task.content = t[1][:content]
          task.save
        else
          task = Task.create(content: t[1][:content])
          self.tasks << task
          self.save
        end
      end
    end
  end

end
