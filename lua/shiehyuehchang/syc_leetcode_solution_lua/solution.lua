-- package.path = "/Users/shiehyuehchang/Projects/leetcode/syc_leetcode_solution_lua/src/?.lua"

-- class Solution
local Solution = {}

-- default constructor
function Solution:new()
  local obj = {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

-- prototype methods
function Solution:fib(n)
  return require "shiehyuehchang.syc_leetcode_solution_lua.src.fib" (self, n)
end

return Solution
