echo "Please enter the password:"
stty -echo
read p
stty sane

printf "the entered password is %s \n" $p
