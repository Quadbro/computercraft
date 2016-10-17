local function refuel()
        local fuel_level = turtle.getFuelLevel()
        if fuel_level == "unlimited" or fuel_level > 300 then return end
   
        local function try_refuel()
                        if turtle.getItemCount(16) > 0 then turtle.select(16)
                                if turtle.refuel(1) then turtle.select(1)
                                        return true
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
 
local function go()
        turtle.suck()
    while not turtle.forward() do turtle.atack() end
end
 
local function go_to_start()
        for n = 1, 5 do turtle.down() end
        for n = 1, 9 do go() end
        turtle.turnRight()
        for n = 1, 8 do go() end
        turtle.turnLeft()
end
 
local function pick_up()
        refuel()
        for n = 1, 16 do
                go()
        end
end
 
local function re()
        turtle.turnLeft()
        go()
        turtle.turnLeft()
end
 
local function re2()
        turtle.turnRight()
        go()
        turtle.turnRight()
end
 
local function coming_back()
        turtle.turnLeft()
        for n = 1, 8 do  go() end
        turtle.turnRight()
        for n = 1, 9 do go() end
        for n = 1, 6 do turtle.up() end
        turtle.turnLeft()
end
 
local function drop_items()
        for n = 1, 15 do
                turtle.select(n)
                turtle.drop()
        end
 
        turtle.down()
 
        for n = 1, 15 do
                turtle.select(n)
                turtle.drop()
        end
 
        turtle.turnLeft()
end
 
refuel()
turtle.select(1)
go_to_start()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
re()
 
pick_up()
re2()
 
pick_up()
 
 
turtle.turnLeft()
turtle.turnLeft()
 
pick_up()
 
refuel()
 
coming_back()
 
drop_items()
