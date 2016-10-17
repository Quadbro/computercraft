local lenght = 20;
local heigth = 6;


local function up(count) 
	for i = 1, count do
		turtle.up();
	end
end

local function fw(count) 
	for i = 1, count do
		turtle.forward();
	end
end

local function dig()
        while turtle.detect() do turtle.dig() end
end
 
local function digUp()
        while turtle.detectUp() do turtle.digUp()  end
end

local function digDown()
        while turtle.detectDown() do turtle.digDown()  end
end

local function go()
        while not turtle.forward() do dig() end
end
 
local function goUp()
        while not turtle.up() do digUp() end
end
 
local function goDown()
        while not turtle.down() do digDown() end
end
-----Tree-cutter

local function upCycle() 
	for j = 1, heigth - 1 do
		goUp();
	end

	for j = 1, heigth - 1 do
		goDown();
	end
end

local function preEnd() 
	go(); go(); goDown();  turtle.turnLeft(); turtle.turnLeft();

	for i = 1,16 do
		turtle.select(i);
		turtle.drop();
	end

	goDown();
end

local function startPlacer()
	turtle.turnLeft();
	turtle.turnLeft();
	goUp();
	turtle.select(1);

	for i = 1, lenght do
		turtle.placeDown();
		go();
	end

	preEnd();
end

local function startCutter() 
	for i = 1, lenght do
		go();
		upCycle();
	end

	startPlacer();
end

local function preCheck() 
	io.write("Checking trees...");
	if (turtle.getItemCount(1) <= 20) then 
		io.write("You need 20 or more trees in slot(1) to begin!");
		return;
	else 
		goUp();
		go(); go();
		startCutter();
	end
end



-- Main

preCheck();
