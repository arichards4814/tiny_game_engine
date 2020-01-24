require_relative './config/environment.rb'


turns = 0
initialize_menus

while turns < 20
    
    # need a way of updating menus here (currently not working.)
    refresh_menus
 ## from menus.rb module menus
UI.start_menu("main_menu_ui") ##starts up your first menu by name


GameEvent.increment_game_clock(1)
turns += 1
binding.pry
end


# puts MultiSelectUI.selected
# puts SingleSelectUI.selected 
binding.pry