import sys

if len(sys.argv) == 3:
    user = sys.argv[1]
    name = sys.argv[2]
else:
    print("user name")
    exit()

with open(f"/home/{user}/openvpn-client/client.conf","r") as conf_file:
    print()
    new = ""
    for symbols in conf_file.readlines():
        line = ""
        for symbol in symbols.split():
            if "{replace_this_user}" in symbol:
                line2 = symbol.replace("{replace_this_user}", user)
                if "{replace_this_name}" in line2:
                    line += line2.replace("{replace_this_name}", name)
                else:
                    line += line2
            else:
                if symbols.split().index(symbol) == len(symbols.split()):
                    line += symbol
                else:
                    line += symbol + " "
        new += line + "\n"
        print(line)
with open(f"/home/{user}/openvpn-client/client.conf", "w") as test:
    test.write(new)
