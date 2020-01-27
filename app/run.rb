require_relative './config/environment.rb'


## create your menus in the menu_builder.rb file
initialize_menus
initialize_gametriggers
turn = GameEvent.gameclock


## main game loop

while GameEvent.gameclock < 200



refresh_menus #updates our menus to show the most up to date info



#UI.start_menu("main_menu_ui") ##starts up your first menu by name




GameEvent.turn_summary
GameEvent.increment_game_clock(1)

end