#! /bin/bash

ALIASES=(
	"k='kubectl'"
	"kg='k get -o'"
	"kd='k describe'"
	"ke='k explain'"
	"kgp='kg pod'"
	"kgd='kg deploy'"
	"kgn='kg nodes'"
	"kgs='kg svc'"
	"kdp='kd pod'"
	"kdd='kd deploy'"
	"kds='kd svc'"
	"kdn='kd node'"
)

AUTOCOMPLETE="kubectl completion bash"

if [ "$1" == "xe" ] 
then
	echo "Debug mode set"
	set -xe;
fi

echo "This script adds kubectl helpers"

echo "" >> ~/.bashrc
echo "# kubectl aliases (generated)" >> ~/.bashrc
echo "" >> ~/.bashrc

function addToBashrc()
{
	for ele in "${ALIASES[@]}"
	do
		if [ "$1" == true ]
		then
			read -p "Add $ele? " yn
			case $yn in
				[Nn]* ) ;;
				* ) echo "alias $ele" >> ~/.bashrc;;
			esac
		else
			echo "alias $ele" >> ~/.bashrc
		fi
	done
}


read -p "Install all aliases at once? " yn
case $yn in
    [Nn]* ) addToBashrc true;;
    * ) addToBashrc;;
esac

read -p "Install autocompletion? " yn
case $yn in
    [Nn]* ) ;;
    * ) echo "" >> ~/.bashrc; echo "$AUTOCOMPLETE" >> ~/.bashrc;;
esac

echo "" >> ~/.bashrc
echo "# kubectl aliases end (generated)" >> ~/.bashrc
echo "" >> ~/.bashrc

source ~/.bashrc
