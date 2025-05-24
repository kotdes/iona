local PacakgeRoot = script.Parent.Parent

local Types = require(PacakgeRoot.Types)

return function(arg: Types.CanBeValue<any>): boolean
    if typeof(arg) == "table" then
        if arg.type == "State" then
            return true
        end
    end

    return false
end