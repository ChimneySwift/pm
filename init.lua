
------------------------
--Individual Messaging--
------------------------

local recipient

minetest.register_chatcommand("pm", {
    description = "Sends a pm to a specified player. Input no parameters to check recipient.",
    func = function(param)
    if param == "" then
        if recipient == nil then
            minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must first select a recipient with .pm_set.")
        else
            minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " Selected recipient: " .. recipient)
        end
    else
        if recipient == nil then
            minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must first select a recipient with .pm_set.")
        else
            minetest.run_server_chatcommand("msg", recipient .. " " .. param)
        end
    end
end })

minetest.register_chatcommand("pm_set", {
    description = "Sets the recipient for messages sent with .pm. Recipient names are case sensitive.",
    func = function(param)
    if param == "" then
        minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must enter a recipient.")
    else
        recipient = param
        minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " Recipient set to: " .. recipient)
    end
end })

-------------------
--Group Messaging--
-------------------

local recipients = {}

minetest.register_chatcommand("pm_group", {
    description = "Sends a pm to a group of players. Input no parameters to check recipients.",
    func = function(param)
    if param == "" then
        if recipients == {} then
            minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must first add at least 1 recipient with .pm_add.")
        else
            local names = ""
            for _,v in pairs(recipients) do
                names = names .. v .. ", "
            end
            names = names:sub(1, -3)
            if names == "" then
                minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " No recipients have been set")
            else
                minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " Recipients: " .. names)
            end
        end
    else
        if recipients == {} then
            minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must first select a recipient with .pm_set.")
        else
            for _,v in pairs(recipients) do
                minetest.run_server_chatcommand("msg", v .. " " .. param)
            end
        end
    end
end })

minetest.register_chatcommand("pm_add", {
    description = "Adds a recipient to the list. Recipient names are case sensitive.",
    func = function(param)
    if param == "" then
        minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must enter a recipient.")
    else
        table.insert(recipients, param)
        minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " Added recipient: " .. param)
    end
end })

minetest.register_chatcommand("pm_remove", {
    description = "Removes a recipient from the list. Recipient names are case sensitive.",
    func = function(param)
    if param == "" then
        minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " You must enter a recipient.")
    else
        local removed = false
        for _,v in pairs(recipients) do
            if v == param then
                table.remove(recipients, _)
                removed = true
            end
        end
        if removed then
            minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " Removed recipient: " .. param)
        else
            minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " Recipient name not in list. Remember recipient names are case sensitive.")
        end
    end
end })

minetest.register_chatcommand("pm_clear", {
    description = "Clears the recipient list.",
    func = function(param)
    if param == "" then
        recipients = {}
        minetest.display_chat_message(minetest.colorize("#00ff00", "[PM]") .. " All recipients removed.")
    else
        minetest.display_chat_message(minetest.colorize("red", "[PM]") .. " This command does not accept parameters.")
    end
end })
