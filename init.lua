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
