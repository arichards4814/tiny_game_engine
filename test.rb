require_relative './config/environment.rb'

## USE THIS FILE FOR TESTING YOUR GAME
## USEFUL FOR SETTING UP SCENARIOS AND MAKING
## SURE EVERYTHING IS WORKING


turns = 0
initialize_menus

while turns < 20
    
    
refresh_menus #updates our menus to show the most up to date info



UI.start_menu("main_menu_ui") ##starts up your first menu by name


##here going to have to clear anything that is selected
GameEvent.increment_game_clock(1)

turns += 1
end


# puts MultiSelectUI.selected
# puts SingleSelectUI.selected 
binding.pry