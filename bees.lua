turtleslots = 16


--Await input that breeding is complete


-- Break and replace the breeder
turtle.dig("right")

placed = false
for i=1, turtleslots
do
    local item = turtle.getItemDetail(i)
    if item then
      print(item.name)
      if item.name == "roost:breeder" then
        turtle.select(i)
        placed = turtle.place()
        break
      end
    end
end

if ~placed then
    print("cannot find breeder!")
    os.exit(1)
end


--Wait a moment for items to return to turtles inv
os.sleep(1)

--If we have seeds, place them
for i=1, turtleslots
do
    print(i)
    local item = turtle.getItemDetail(i)
    if item then
      print(item.name)
      if item.name == "minecraft:wheat_seeds" then
        turtle.select(i)
        turtle.drop()
        break
      end
    end
end
  
shouldContinue = true
    
while shouldContinue do
      local indexBestChicken = redstone.getAnalogInput("back")
      print(indexBestChicken)
      turtle.select(indexBestChicken)
      t = turtle.drop()
      print(t)
      shouldContinue = t
      os.sleep(1)
end

for i=1, turtleslots
do
    local item = turtle.getItemDetail(i)
    if item then
      if item.name ~= "minecraft:wheat_seeds" and item.name ~= "roost:breeder" then
        turtle.select(i)
        turtle.dropDown()
        break
      end
    end
end
