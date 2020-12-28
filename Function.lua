local function partial(fn, ...)
    local partialArguments = {...}
    return function (...)
        local arguments = Array.concat(partialArguments, {...})
        return fn(unpack(arguments))
    end
end

local function curry(fn, numberOfParameters)
    local numberOfParametersPassed = 0
    local arguments = {}

    local curriedFunction
    curriedFunction = function (...)
        local passedArguments = {...}
        numberOfParametersPassed = numberOfParametersPassed + #passedArguments
        Array.append(arguments, passedArguments)
        if numberOfParametersPassed == numberOfParameters then
            return fn(unpack(arguments))
        else
            return curriedFunction
        end
    end

    return curriedFunction
end

Function = {
    partial = partial,
    curry = curry
}
