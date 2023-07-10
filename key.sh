
unset key
unset passwd
echo -e "\e[32m"
p="KEY : " 
while IFS= read -p "$p" -r -s -n 1 char
do
	if [[ $char == $'\0' ]]
	then
		break
	fi
	p='#'
	key+="$char"
done
echo " "
echo -e "\e[32m"
a="PASSWORD : " 
while IFS= read -p "$a" -r -s -n 1 char
do
	if [[ $char == $'\0' ]]
	then
		break
	fi
	a='*'
	passwd+="$char"
done
echo " "
echo " "
echo -e "\e[31m"
openssl enc -d -aes-256-cbc -base64 -in .x.html -pbkdf2 -iter $key -k $passwd

