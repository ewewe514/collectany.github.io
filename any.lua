task.spawn(function()
    while true do
        local activateRemote = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemotePromise"):WaitForChild("Remotes"):FindFirstChild("C_ActivateObject")

        if activateRemote then
            local runtimeItems = game.Workspace:WaitForChild("RuntimeItems")

            for _, ammoContainer in pairs(runtimeItems:GetChildren()) do
                if ammoContainer:IsA("Model") and ammoContainer.Name == "RevolverAmmo" then
                    local ammo = ammoContainer:FindFirstChild("RevolverAmmo")
                    if ammo then
                        local targetPart = ammo:FindFirstChildWhichIsA("BasePart") or ammo

                        local args = { targetPart.Parent }
                        activateRemote:FireServer(unpack(args))
                    end
                end
            end
        end
        task.wait(0.6) -- Adding delay between activations
    end
end)
