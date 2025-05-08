task.spawn(function()
    while true do
        local activateRemote = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemotePromise"):WaitForChild("Remotes"):FindFirstChild("C_ActivateObject")

        if activateRemote then
            local runtimeItems = game.Workspace:WaitForChild("RuntimeItems")

            for _, item in pairs(runtimeItems:GetChildren()) do
                if item:IsA("Model") and item.PrimaryPart then -- Collect ANY model with a PrimaryPart
                    local args = { Instance.new("Model", nil) }
                    activateRemote:FireServer(unpack(args))
                end
            end
        end
        task.wait(0.3) -- Adding delay between activations
    end
end)
