BASE_DIR="( dirname $0 )"
DIR="$(pwd)"
FILE=$BASE_DIR/DIR/source_me

if [ $# -ne 0 ]; then
    PROFILE=.bash_profile
else
    PROFILE=$1
fi

echo "Adding RC to the bash profile"
echo "#Dane's Bash Functions" >> $HOME/$PROFILE
echo "source $FILE" >> $HOME/$PROFILE
echo "Done with setup, restart bash to get functionality"
