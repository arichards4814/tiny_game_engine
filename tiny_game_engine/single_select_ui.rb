class SingleSelectUI < UI
    
    @@selected = ""

    def initialize(menu_title)
            super
            @chosen = []
            @menu_type = "singleselect"
    end

##Defaults to a Vertical Menu
##Can support unlimited items
    def self.selected
        @@selected
    end

    def visual 
                i = 0
                while i < (menu_items.count)
                    
                    puts "   #{menu_items[i]}"
                    i += 1
                end 
    end

def prompt(new_menu_items)
        #this will puts out the visual
        #then will get input and return it
        #will make sure input is not blank
        
        update_menu_items(new_menu_items)

        UI.blank_space(5)
        build_border
        if @has_border 
            puts border_visual
        end
        puts @header
        if @has_divider
            puts border_visual
        end
        if @body.class == Method
        puts @body.call
        else
        puts @body
        end
        self.visual
        if @has_border
            puts border_visual
        end
        if @question_prompt.class == String
        puts @question_prompt
        elsif @question_prompt.class == Array
            @question_prompt.each do |ele|
                puts ele
            end
        end
        # get input from player

        input = gets.chomp

            if input == "back" || input == "quit" || input == "h" || input == "help"||input == "-h"
                #get_input(input)
            elsif input.to_i == 0 || input.to_i > menu_items.count || input == nil || input == ""
                puts "Option not available.".red
                self.prompt(new_menu_items)
            else
                input = input.to_i
                make_one_choice(input)
            end
end



    def make_one_choice(num_input)
        if num_input > self.menu_items.count || num_input == "" || num_input == nil || num_input == 0
            self.prompt(new_menu_items)
        else
        @@selected = self.menu_items[num_input - 1 ].split(" - ")[1]
        end
    end



    def update_menu_items(new_items_array)
        if new_items_array == nil
            @body = "There is nothing to select." 
        else
            @menu_items.each_with_index do |item, index|
                menu_items[index] = ""
            end
            new_items_array.each_with_index do |new_item, index|
                @menu_items[index] = "[#{index + 1}] - #{new_item}"
            end
        end
    end

    def clear_all_selected
        @@selected == ""
    end

end