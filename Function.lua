local function partial(fn, ...)
    local partialArguments = {...}
    return function (...)
        local arguments = Array.concat(partialArguments, {...})
        return fn(unpack(arguments))
    end
end

Function = {
    partial = partial
}
