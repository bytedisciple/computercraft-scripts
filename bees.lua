turtleslots = 16


--Await input that breeding is complete


-- Break and replace the breeder
turtle.select(1)
turtle.dig("right")
turtle.place()

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
      local indexBestChicken = redstone.getAnalogInput("bottom")
      print(indexBestChicken)
      turtle.select(indexBestChicken)
      t = turtle.drop()
      print(t)
      shouldContinue = t
      os.sleep(1)
end
