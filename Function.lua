local addOnName = 'Function'
local version = '2.0.1'

if _G.Library then
  if not Library.isRegistered(addOnName, version) then
    local Array = Library.retrieve('Array', '^2.0.0')

    --- @class Function
    local Function = {}

    function Function.partial(fn, ...)
      local partialArguments = { ... }
      return function(...)
        return fn(unpack(partialArguments), ...)
      end
    end

    function Function.curry(fn, numberOfParameters)
      local numberOfParametersType = type(numberOfParameters)
      if numberOfParametersType ~= 'number' then
        print('Invalid argument: numberOfParameters. ' .. numberOfParametersType .. ' given instead of number.')
        return
      end

      local numberOfParametersPassed = 0
      local arguments = {}

      local curriedFunction
      curriedFunction = function(...)
        local passedArguments = { ... }
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

    function Function.noOperation()

    end

    function Function.identity(value)
      return value
    end

    function Function.alwaysTrue()
      return true
    end

    function Function.isTrue(value)
      return not not value
    end

    function Function.returnValue(value)
      return function()
        return value
      end
    end

    function Function.once(fn)
      local hasBeenRun = false
      return function(...)
        if not hasBeenRun then
          hasBeenRun = true
          return fn(...)
        end
      end
    end

    function Function.alwaysFalse()
      return false
    end

    Library.register(addOnName, version, Function)
  end
else
  error(addOnName .. ' requires Library. It seems absent.')
end
