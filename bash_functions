function cs () {
	builtin cd "$@" && ls
}
alias cd=cs

#
#	Commits and pushes all changes in this git repository with the supplied commit message
#
function gpa () {
	git add -A && git commit -m $1 && git push
}

function run_jaeger () {
    docker run -d --name jaeger \
        -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
        -p 5775:5775/udp \
        -p 6831:6831/udp \
        -p 6832:6832/udp \
        -p 5778:5778 \
        -p 16686:16686 \
        -p 14268:14268 \
        -p 9411:9411 \
        jaegertracing/all-in-one:1.9
}

# creates an alias in the current directory and then sources it
# Adapted from aliasHere by Anthony Forsythe
ALIASES_FILE=$HOME/.aliases.sh
if [ -f $ALIASES_FILE ]; then
    source $ALIASES_FILE
fi
function aliasHere () {
    if [ $# -ne 1 ]; then
        echo 'usage: aliasHere <alias name>'
        return
    fi
    #define the alias file
	if [ -f $ALIASES_FILE ]; then
		;
	else
		touch $ALIASES_FILE
	fi
    #define the current path
    currPath=$(pwd)
    currDate=$(date)
    echo $currPath
    echo $currDate
    echo "#		" >> $ALIASES_FILE
	echo "#		New alias named $1 added on $currDate" >> $ALIASES_FILE
	echo "#		" >> $ALIASES_FILE
    echo "alias $1='cd ${currPath// /\ }'" >> $ALIASES_FILE
    echo "" >> $ALIASES_FILE
    echo "" >> $ALIASES_FILE
    source $ALIASES_FILE
}
