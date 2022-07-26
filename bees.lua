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
    local item = turtle.ItemDetails(i)
    if item then
      print(item.name)
      if item.name == "Seeds" then
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
      shouldContinue = turtle.drop()
end
