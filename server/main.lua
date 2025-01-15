local currentTime = os.date("%d/%m/%Y %H:%M")

AddEventHandler('onResourceStart', function()
  CreateThread(function()
    while true do
      for key, values in pairs(Scripts) do
        if values.date == currentTime then
          values.script()
          print(string.format("%s executed : %s", Config.debugPrefix, key))
        end
      end

      Wait(Config.delay)
    end
  end)
end)

