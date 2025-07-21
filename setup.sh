BASE_DIR="$( dirname $0 )"
DIR="$(pwd)"
FILE=$DIR/source_me

if [ $# -ne 1 ]; then
    PROFILE=.bash_profile
else
    PROFILE=$1
fi

echo "BASE_DIR $BASE_DIR"
echo "DIR $DIR"
echo "FILE $FILE"
echo "PROFILE $PROFILE"

echo "Adding RC to the bash profile"
echo "#Dane's Bash Functions" >> $HOME/$PROFILE
echo "source $FILE" >> $HOME/$PROFILE
echo "Done with setup, restart bash to get functionality"
