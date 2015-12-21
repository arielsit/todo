require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'
# require_relative 'app/models/task_model'

#====================================
# to LIST the tasks
#====================================
def tasks_list
	tasks = TasksController.list   # go to Class TaskControllers and call the method "list"
	tasks.each do |t|

# this will print: the converted task ID(becomes string) <space> task name <space> 
		p "(" + t.id.to_s + ")" + " " + t.task_name + " " + "[#{t.completed.to_s}]"
	end
	if tasks.empty?
		puts "==========================================================================="
		puts "TO-DO list is empty! Go ahead and add a task(like change the world)! :)"
		puts "```````````````````````````````````````````````````````````````````````````"
	end
end

#====================================
# to ADD the tasks
#====================================
def tasks_add(taskname)
	task = TasksController.add(taskname)
	p "Added task ==>" + " " + taskname
	print tasks_list
end

#====================================
# to DELETE the tasks
#====================================
def tasks_delete(id_delete)
	TasksController.delete(id_delete)
	print tasks_list
end

#====================================
# to UPDATE the tasks: DONE
#====================================
def tasks_update_done(id_update)
	TasksController.update_done(id_update)
	puts "Task no.#{id_update} is completed! Way to go! :D"
	print tasks_list
end

#====================================
# to UPDATE the tasks: NOT DONE YET, MANNNNN 
#====================================
def tasks_update_undone(id_update)
	TasksController.update_undone(id_update)
	puts "Task no.#{id_update} not done yet!" + " " + '¯\_(ツ)_/¯ Try harder, mannn!'
	print tasks_list
end

#====================================
# to DELETE ALL the tasks
#====================================
def tasks_delete_all
	TasksController.delete_all
	print tasks_list 
end

#====================================
# ARGV: to GET input from the terminal as the (argument) and react according to the methods below
#====================================

def todo_menu
 if ARGV.any?

 	case ARGV[0]
 		when "list"
 		tasks_list

 		when 'add'
 		tasks_add(ARGV[1..-1].join(" "))

 		when 'delete'
 		tasks_delete(ARGV[1])

 		when 'deleteall'
 		tasks_delete_all

 		when 'updatedone'
 		tasks_update_done(ARGV[1])

 		when 'updateundone'
 		tasks_update_undone(ARGV[1]) 

 	end
 	
 end

end

#====================================
# the main display interface when the app launches.
#====================================

puts
linebreak = "==========================================================================="

puts linebreak
puts "Hi! I'm your WORLD-CHANGING TO-DO List :)"
puts linebreak
puts "Menu:"
puts "````````````````````````````````````````````````````````````````````````````"
puts "To VIEW full to-do list, type ==> ruby start.rb list"
puts "To ADD new task, type ==> ruby start.rb add (your task here)"
puts "To DELETE a to-do item, type ==> ruby start.rb delete (task id)"
puts "To mark task COMPLETION, type ==> ruby start.rb updatedone (task id)"
puts "To mark task UNDONE, type ==> ruby start.rb updateundone (task id)"
puts "==========================================================================="
puts "Task ID  |  Task Name  |  Completion (0 = not completed, 1 = completed)"

todo_menu


