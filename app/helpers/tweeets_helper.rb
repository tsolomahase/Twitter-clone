module TweeetsHelper
  def choose_new_or_edit
         if action_name == 'new'
             confirm_tweeets_path
         elsif action_name == 'edit'
             tweeet_path
         end
     end
end
