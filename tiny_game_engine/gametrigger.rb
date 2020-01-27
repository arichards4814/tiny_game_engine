class GameTrigger

## class to store conditions to where the game state will change
## initializes with a variable that will be checked against an integer
## once that condition is met the method_on_met will run
attr_accessor :check_variable, :condition_as_string, :int_to_compare, :method_on_met, :victory_message, :loss_message

@@all = []
def initialize(check_variable, condition_as_string, int_to_compare, method_on_met)
    @check_variable = check_variable
    @condition_as_string = condition_as_string
    @int_to_compare = int_to_compare
    @method_on_met = method_on_met #method to call when condition is met

    @@all << self
end

def update_gamestate
    #based on what comparison operator was given as a string
    #run that specific if statement

    if @condition_as_string == ">"
        if @check_variable > @int_to_compare
            @method_on_met.call
        end
    elsif @condition_as_string == "<"
        if @check_variable < @int_to_compare
            @method_on_met.call
        end
    elsif @condition_as_string == "=="
        if @check_variable == @int_to_compare
            @method_on_met.call
        end
    elsif @condition_as_string == "true"
        if @check_variable == true
            @method_on_met.call
        end
    elsif @condition_as_string == "false"
        if @check_variable == false
            @method_on_met.call
        end
    end
end

def self.update_all_gamestates

    #cycles through all gamestates 
    #checks if their conditions are met
    #if they are, this will update the gamestate

    GameTrigger.all.each |trigger|
        trigger.update_gamestate
    end
end

end