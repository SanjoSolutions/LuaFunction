require('Array/Array')
require('Object/Object')
require('Testing/Testing')
require('Function')

local expect = Testing.expect

function testCurry()
    local function test(a, b, c)
        return {a, b, c}
    end
    local curriedTest = Function.curry(test, 3)
    local result = curriedTest(1)(2)(3)
    return expect(result).toEqual({1, 2, 3})
end

print(testCurry())
