local fib = function(self, n)
	local res = {0, 1}

	if (n == 0) then
		return res[1]
	elseif (n == 1) then
		return res[2]
	end

	for i = 2, n - 1 do
		local t = res[1] + res[2]
		res[1] = res[2]
		res[2] = t
	end

	return res[1] + res[2]
end

return fib
