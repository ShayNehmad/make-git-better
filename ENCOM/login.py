# -*- coding: utf-8 -*- 
### LICENSED TO ENCOM
### COPYRIGHT 1989
### AUTHOR: Ed Dillinger
import sys

def main():
    print("Trying to log in...")
    try:
        login()
    except:
        print("Something went wrong. This incident has been reported to ENCOM security >:(")
        sys.exit(1)

def login():
    prompt = """::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
,,;;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;,,,,,
,,;;;::;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;;,,,,
,;;;;;;;:lddddddddddddddddddddddddddxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxddddxxxxxxxxxxxxddddddddxxxxxdddddl;,,,,
,;;::;lx0XWWWMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWW0c,,,,
,;;;:oKWWNK0OOOOOOOOOOOOOOO0OO0000OO00O0000000OO00O000000OOOOOOO0000O00O00000OOOOO00OOO0O00OOOO0O000OOO00OO0O00OOOd:,,,,
,;;;c0MWNxccddoooodddddool::coddddol:::::::coddl:::::clodddxxxxddoc::::::cooddxxdddolc:::::ldddddl::::::::::codddol:,,,,
,;;;lKMWKl:xNWWWWWWWWWWWWO:;xNWWWWWKo::::::dXWWOc::lkKNNWWMMMMWWWNKxc::oOXNWWWWWWWWWNKOl::cOWWWWWKo::::::::l0WWWWWKl,,,,
;;:;lXWWKl;xWMWKxxxxxxxxxo::xNWWNNMMKo:::::dNMMOc;l0WWN0kxxxxxxOXWWNx:lKWWN0kxxxxxk0NWW0l;l0MMWNWW0l::::::cOWMWWWWXl,;,,
;;;;lKWMKl;xWMWk:::;;::;;::;xWMWOkWMWKo::::dNWWOc:xNWW0c;:::::::xNWNk:xNWWO::::::::cOWWNx;c0MMKONMWOc:::::xNMW00MMKl,;,,
;;;;lKWWKl;xWMWOlcccccccc:::xNMWkcOWWWKo:::dNMWOc:kWMWk:::::::::cooolcOWWNx:::::::::kWWWk:c0WMKdOWWNx::::oXWWKdOWMXl;;,,
;;;;lKMWKl;xWMMWXXXXXXXX0l;:xWMWk:cOWMWXo::dNMWOc:kWWWk::::::::::::::cOWWNx:::::::::xNMMO:c0WWXolKWWXd::l0WWNdcOWMXl;;,,
;;;;lKMWKl;xWMMKkkkkkkkkxc;:xNMWk:;cOWWWXd:dNMWOc:kWWWk::::::::::::::cOWMNx:::::::::xWMWO:c0WWXo;oXWWKl:OWWNk::OMMXl;;,,
;;:;lKMMKl;xWMWk:;;;;;;;;::;xWMWk::;cONWWXodNMWOc;xNWWOc::::::::cxOOxcOWMWx:::::::::kWMWk:c0MMXo;:xNMWkxXMWOc;c0MMXl;;,,
;;;;lKWMKl;xWMWk:;;;;;;;;:::xNMWk::::ckNWWKONMMOc:oXWWKo::::::::xNWWOcxNWWOl:::::::l0WMXd;c0MMXo;::kWMNNWWKl:::OMMXl;;;,
;;;;lKMMKl;xWMWXOOOOOOOOOd:;xNMWk:::::ckNMWWWMWOc:cOWWWX0OOOOOOKNWWNx:l0WMWK0OOkOO0XWMNOc;c0WWXo;:;cOWMWWXd:;;cOMMXl;;;,
;;:;lKMMKl;dXXXNNXXNNNXXXkc;dKXXx:::::::xXXXNXXk:::cxOKXNNNNNNNNXK0dc::lx0KXXNNNNNXXKOdc::cOXX0o:::;l0XXXx:;:;c0WWXl;;;,
;;;;cOWMNOolooooooooooooolcclooolcccccccloooooolcccccclooddddddoolcccclccclooodddooolcccccclooolcccccloolcccclkNWWKl;;;,
;;;;;cONWWNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXNWMW0l;;;;;
;;;;:::ok0KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOd:;:;;;;
;;;;:;;;;:cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc:;;;;;;;;;
;;;;:;;;;;;;::;;;;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;;:;;;;;
;;;;;;;;;;;;;;;;;;;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;;;;;;;;:::::::;;;;;;;;
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"""
    print(prompt)
    # TODO: I think I should check credentials here. Well, maybe later... 💤

if __name__ == "__main__":
    main()
