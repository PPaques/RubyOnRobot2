module ApplicationHelper
  def is_selected(my_controller)
    "active" if (controller_name == my_controller && !(controller_name == 'companies' && action_name == 'edit')) || (action_name == my_controller && !(controller_name == 'companies' && action_name == 'edit'))
  end
end