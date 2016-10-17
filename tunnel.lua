-- Menu------------------------------------------------------
local heigth,  width, length
 
io.write("Enter heigth:") heigth = io.read()
if heigth < "1" then
        print( "Error, check the values!" ) return
end
 
io.write("Enter  width:")  width = io.read()
if  width < "1" then
        print( "Error, check the values!" ) return
end
 
io.write("Enter length:") length = io.read()
if length < "1" then
        print( "Error, check the values!" ) return
end
heigth = tonumber(heigth);
width = tonumber(width);
length = tonumber(length);
---------------------------------------------------------------
-- Functions---------------------------------------------------
local function dig()
        while turtle.detect() do turtle.dig() end
end
 
local function dig_up()
        while turtle.detectUp() do turtle.digUp()  end
end
 
local function dig_down()
        while turtle.detectDown() do turtle.digDown()  end
end
---------------------------------------------------------------
local function refuel()
        local fuel_level = turtle.getFuelLevel()
        if fuel_level == "unlimited" or fuel_level > 300 then return end
       
        local function try_refuel()
                for n=1,16 do
                        if turtle.getItemCount(n) > 0 then turtle.select(n)
                                if turtle.refuel(1) then turtle.select(1)
                                        return true
                                end
                        end
                end
                turtle.select(1)
                return false
        end
       
        if  try_refuel() then
                print( "Fuel level is:".. turtle.getFuelLevel())
        else
                print( "Need more fuel!!!." )
                while not try_refuel() do sleep(1) end
                print( "Going back to work!." )
        end
end
---------------------------------------------------------------
local function go()
        while not turtle.forward() do dig() end
end
 
local function go_up()
        while not turtle.up() do dig_up() end
end
 
local function go_down()
        while not turtle.down() do dig_down() end
end
---------------------------------------------------------------
-- Main loop---------------------------------------------------
-- Digging-----------------------------------------------------
for n = 1, length do
        go()
        turtle.turnRight()
        for m = 1, width do
                for n = 1, heigth - 2 do go_up() end
                dig_up()
                for n = 1, heigth - 2 do go_down() end
                dig_up()
                if m ~= width then go() end
        end
            for n = 1,  width - 1 do turtle.back() end
            turtle.turnLeft()
end
print( "Tunnel complete." )
-- Come back---------------------------------------------------
print( "Returning to start..." )
for n = 1, length do turtle.back() end
turtle.turnLeft()
turtle.turnLeft()
for n = 1, 15 do
        turtle.select(n)
        turtle.drop()
end
turtle.turnRight()
turtle.turnRight()
---------------------------------------------------------------
