AddEventHandler('onResourceStart', function()
  for key, values in pairs(Scripts) do
    local currentDay = os.date("%d/%m/%Y")
      
    if currentDay == values.date then
      CreateThread(function()
        while true do
          local currentTime = os.date("%H")

          if currentTime == values.time then
            values.script()
            print(string.format("%s executed : %s", Config.debugPrefix, key))
            return
          end

          wait(Config.delay)
        end
      end
    end)
  end
end)
