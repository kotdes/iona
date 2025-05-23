local PacakgeRoot = script.Parent.Parent

local Types = require(PacakgeRoot.Types)

return function(arg: Types.CanBeValue<any>): boolean
    if typeof(arg) == "table" then
        if arg.kind == "State" and arg.set then
            return true
        end
    end

    return false
end