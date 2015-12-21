require_relative '../../config/application'
require_relative '../models/task_model.rb'

class TasksController

  def self.list
    Task.all
  end

  def self.add(taskname)
    Task.create(id: Task.count+1, task_name: taskname, completed: "not done")
  end

  def self.delete(id)
    # delete the task id that is passed in
    Task.delete(id) 
    # after that, all the remaining tasks which the id is LARGER THAN <passed in id>
    # then the for the remaing task ID, each one do < x >
    Task.where("id > ?", id).each do |x|
    # so that the SECOND ID in the remaining task will be the NEW first undone task.
      x.id = x.id - 1
    # save the list with updated task ID
      x.save
    end
  end

  def self.delete_all
    Task.delete_all
  end

  def self.update_done(id)
    task = Task.find(id)
    # to mark the task as completed with the remarks < X >
    task[:completed] = "done"
    task.save
  end

  def self.update_undone(id)
    task = Task.find(id)
    # to mark the task as completed with the remarks < 0 >
    task[:completed] = "not done"
    task.save
  end

end

