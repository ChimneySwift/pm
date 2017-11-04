# pm
Makes sending PMs in Minetest faster.

## Commands
### pm <message>
Will send a PM via `/msg` to the recipient selected via `.pm_set`.
If no arguments are given it will return the current recipient.

### pm_set <playername>
Sets the recipient for messages sent with `.pm`. Player names are case sensitive.

### pm_group <message>
Sends the message to the group of players selected with `.pm_add`. Input no parameters to check recipients.

### pm_add <playername>
Adds playername to the group recipient list. Recipient names are case sensitive.

### pm_remove <playername>
Removes playername from the group recipient list. Recipient names are case sensitive.

## Change Log

* Fixed crash when trying to send message without a recipient having being first set
* Added group recipient functionality

## How to install
1. Enter your minetest directory.
2. Find the `clientmods` directory.
3. Unpack this mod into that directory.
4. Rename unpacked directory (should be named `pm-master`) to `pm`.
5. Set the in-game setting `enable_client_modding` to true.
6. You're done!

## License
Code: **MIT License**
