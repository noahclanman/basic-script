#!/bin/bash

#Creating slowdns menu
function CreateMenu(){
    cat <<'EOFSlowdns' > /bin/slowdns
    #!/bin/bash
    clear
    echo -e "SHINU SLOWDNS MENU"
    echo -e ""
    echo -e "Version 1 (beta)"
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e "COMMAND LIST"
    echo -e ""
    echo -e "1. STARTDNS"
    echo -e "2. STOPDNS"
    echo -e "0. EXIT"
    echo -e ""
    read -p "Input The Command #: " tomana
    case $tomana in
    1) option1 ;;
    2) option2 ;;
    0) option0 ;;
    *) echo "Please Input Numbers Only" ; slowdns ;;
    esac
    option1() {
    echo "1"
    }
    option2() {
    echo "2"
    }
    option0() {
    echo "0"
    }
    EOFSlowdns
}

#START COMMANDS HERE

#START INSTALLATION HERE
CreateMenu