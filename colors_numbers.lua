local inputSide = "right"
local outputSide = "top"
local outputSide2 = "back"

local plusSide = "right"
local minusSide = "left"

-- colors array for easy call
local col = {
	2^0, 2^1,  2^2,  2^3,  
	2^4, 2^5,  2^6,  2^7,  
	2^8, 2^9,  2^10, 2^11, 
	2^12, 2^13, 2^14, 2^15
}

--Offset color call (lua specific)
local function c (n)
	return col[n+1]
end

local numbersLeft = {
	-- 0,1,2,3,4,5,6,7,8,9
	colors.combine(c(8), c(9),  c(10),  c(11), c(12), c(13)),
	colors.combine(c(9), c(10)),
	colors.combine(c(8), c(9),  c(11),  c(12), c(14)),
	colors.combine(c(8), c(9),  c(10),  c(11), c(14)),
	colors.combine(c(9), c(10), c(13),  c(14)),
	colors.combine(c(8), c(10), c(11),  c(13), c(14)),
	colors.combine(c(8), c(10), c(11),  c(12), c(13), c(14)),
	colors.combine(c(8), c(9),  c(10)),
	colors.combine(c(8), c(9),  c(10),  c(11), c(12), c(13), c(14)),
	colors.combine(c(8), c(9),  c(10),  c(11), c(13), c(14))
}

local numbersRight = {
	-- 0,1,2,3,4,5,6,7,8,9
	colors.combine(c(0), c(1),  c(2),  c(3), c(4), c(5)),
	colors.combine(c(1), c(2)),
	colors.combine(c(0), c(1),  c(3),  c(4), c(6)),
	colors.combine(c(0), c(1),  c(2),  c(3), c(6)),
	colors.combine(c(1), c(2), c(5),  c(6)),
	colors.combine(c(0), c(2), c(3),  c(5), c(6)), 
	colors.combine(c(0), c(2), c(3),  c(4), c(5), c(6)),
	colors.combine(c(0), c(1),  c(2)),
	colors.combine(c(0), c(1),  c(2),  c(3), c(4), c(5), c(6)),
	colors.combine(c(0), c(1),  c(2),  c(3), c(5), c(6))
}

--Offset num call (lua specific) left side
local function nl (n)
	return numbersLeft[n+1]
end

--Offset num call (lua specific) right side
local function nr (n)
	return numbersRight[n+1]
end

local function getDoubleNumber (n) 
	if (n < 0 or n > 99) then
		return
	end

	local first
	local second

	if (n > 9) then
		first = math.floor(n/10)
		second = n%10
	end

	if (n < 10) then
		first = "0"
		second = n
	end

	return nl(first) + nr(second)
end

local signal = 0

local function plus()
	signal = signal + 1
	if (signal >= 15) then
		signal = 15
	end
end

local function minus()
	signal = signal - 1
	if (signal <= 0) then
		signal = 0
	end
end

local isSignal = false;

while 1 do
	redstone.setBundledOutput(outputSide, getDoubleNumber(signal))
	redstone.setAnalogOutput(outputSide2, signal)
	sleep(0.2)

	if (not redstone.getInput(minusSide) and not redstone.getInput(plusSide)) then
		isSignal = false
	end
	
	if (redstone.getInput(minusSide) and not isSignal) then
		minus()
		isSignal = true
	end

	if (redstone.getInput(plusSide) and not isSignal) then
		plus()
		isSignal = true
	end

end
