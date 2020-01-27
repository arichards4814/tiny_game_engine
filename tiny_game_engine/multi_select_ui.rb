class MultiSelectUI < UI
    
    @@selected = []
    
    def initialize(menu_title)
        super
        @menu_type = "multiselect"
    end

    def self.selected
        @@selected
    end

    def self.clear_selected
        @@selected = []
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
            get_input(input)
        elsif input == "done"
            if @@selected == nil || @selected == []
                self.prompt(new_menu_items)
            end
            final_selected = @@selected #need to do this so selected is cleared for next turn
            clear_menu_choices
            return final_selected 
        elsif input == "clear"
            clear_choices(new_menu_items)
        elsif input == "" && @@selected.count > 0
            @@selected
        elsif input.to_i > menu_items.count || input.to_i == 0
                puts "option not available".red
                self.prompt(new_menu_items)
        else
            input = input.to_i
            make_choice(input, new_menu_items)
        end
        # make decision using that input about what method to run
        # get_input(input)
        if @response
            puts @response
        end
    end


def make_choice(num_input, new_menu_items)
    #-1 from num input to get the element of the array
    if num_input > self.menu_items.count || num_input == "" || num_input == nil || num_input == "\n"
        self.prompt(new_menu_items)
    else
        new_menu_items[num_input - 1] =  new_menu_items[num_input - 1].green
        @@selected << self.menu_items[num_input - 1 ].split(" - ")[1] 
    end
    self.prompt(new_menu_items)
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
        binding.pry
    end
end

def clear_menu_items
        @menu_items = []
end

def clear_choices(new_items_array)
    new_items_array = new_items_array.map do |item|
        binding.pry
        item = item.black
    end
    @@selected = []
    self.prompt(new_items_array)
end

def clear_menu_choices
    binding.pry
    self.menu_items = self.menu_items.map do |item|
        binding.pry
        if item == "" || item == nil
        else
        item = item.split(" - ")[1].black
        end
    end
    @@selected = []
end

end