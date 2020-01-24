require_relative '../config/environment.rb'





module Menus

def initialize_menus

    ## build your menus here
    main_menu_ui = UI.new("main_menu_ui")
    main_menu_ui.menu_items = ["[1] - Try to Raise Capital  ", "[2] - Hire Employees        ", "[3] - Build/Improve Products",
                            "[4] - View Company", "[5] - View Employees", "[6] - View Products"]
    main_menu_ui.header = "                               MAIN MENU : Turn #{GameEvent.gameclock}"
    main_menu_ui.body = "This is a cool test for the menus..."
    main_menu_ui.has_border = true
    main_menu_ui.border_type = "dash-lg"
    main_menu_ui.has_divider = true
    main_menu_ui.parent_menu = main_menu_ui

    select_menu_test = MultiSelectUI.new("select_menu_test")
    select_menu_test.menu_items =["[1] - Create a Dragon", "[2] - View Dragons      ", "[3] - Check Human Population", "       [4] - Create a Raid", "    [5] - Pass", "[6] - Help"]
    select_menu_test.header = ""
    select_menu_test.body = "           Number of Dragons:".blue
    select_menu_test.has_border = true
    select_menu_test.has_divider = true
    select_menu_test.border_type = "dash-lg"
    select_menu_test.parent_menu = select_menu_test

    one_choice_menu = SingleSelectUI.new("one_choice_menu")
    one_choice_menu.menu_items =["[1] - Create a Dragon", "[2] - View Dragons      ", "[3] - Check Human Population", "       [4] - Create a Raid", "    [5] - Pass", "[6] - Help"]
    one_choice_menu.header = ""
    one_choice_menu.body = "           Number of Dragons:".blue
    one_choice_menu.has_border = true
    one_choice_menu.has_divider = true
    one_choice_menu.border_type = "dash-lg"
    one_choice_menu.parent_menu = select_menu_test

    ## Build your Menu Logic Here
    array = ["Hello", "Goodbye"]
    select_menu_lambda = lambda {select_menu_test.prompt(array)}
        
    main_menu_ui.set_logic(select_menu_lambda)
    # one_choice_menu.set_logic(select_menu_test.method(:prompt))

end

def refresh_menus
    UI.all.each do |menu|
        menu.header = menu.header
        menu.body = menu.body
    end
end


end