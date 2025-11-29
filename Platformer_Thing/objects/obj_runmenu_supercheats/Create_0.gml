selection = 0;
if (file_exists("mystery.ini"))
{
	ini_open("mystery.ini");
	if (ini_section_exists("¤¥©®¼µþ"))
		hardcore = 1;
	ini_close();
}
done = 0;
obj_menu_revamped.menu_options = 9;
obj_menu_revamped.menu_label = ["Mirror", "Screen Spin", "No Death", "Blind Map", "L/R Invert", "Blind Spot", "Chaos Mode", "Insanity", "Apply"];
obj_menu_revamped.menu_description = ["Mirrors the screen horizontally. Current setting: ", "Spins the screen constantly.\nCurrent setting: ", "Disables all checkpoints.\nCurrent setting: ", "Hides the map, showing hints occasionally. Current setting: ", "Inverts LEFT/RIGHT and UP/DOWN.\nCurrent setting: ", "Creates a moving, bouncing obstruction.\nCurrent setting: ", "Randomly enables and disables cheats. Current setting: ", "This is it, the ultimate test of your sanity!\nCurrent setting: ", "Return to the previous screen, applying these cheats."];
obj_menu_revamped.menu_description_locked = ["Mirrors the screen horizontally. Current setting: ", "Spins the screen constantly.\nCurrent setting: ", "Disables all checkpoints.\nCurrent setting: ", "Hides the map, showing hints occasionally. Current setting: ", "Inverts LEFT/RIGHT and UP/DOWN.\nCurrent setting: ", "Creates a moving, bouncing obstruction.\nCurrent setting: ", "Locked. To unlock, complete the game perfectly.", "Locked. To unlock, complete Chaos Mode.", "Return to the previous screen, applying these cheats."];
obj_menu_revamped.menu_function = ["toggle", "toggle", "toggle", "toggle", "toggle", "toggle", "togglerequirement", "togglerequirement", "redirect"];
obj_menu_revamped.menu_variable = ["flip_screen", "spin_screen", "no_death_mode", "invisible_map", "invert_controls", "blind_spot", "chaos_mode", "super_chaos_mode", obj_runmenu_cheats];
obj_menu_revamped.menu_var_max = [0, 0, 0, 0, 0, 0, 0, 0, 0];
obj_menu_revamped.menu_var_min = [0, 0, 0, 0, 0, 0, 0, 0, 0];
obj_menu_revamped.menu_var_inc = [0, 0, 0, 0, 0, 0, 0, 0, 0];
obj_menu_revamped.menu_var_req = [0, 0, 0, 0, 0, 0, "perfect", "hardcore", 0];
obj_menu_revamped.menu_toggle_true = ["ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "N/A"];
obj_menu_revamped.menu_toggle_false = ["OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "N/A"];
obj_menu_revamped.last_menu = obj_runmenu_cheats;
