#
#This is the script to verify the server and environment details.
#The user activity will be logged in a file.
#
#
#Written on: 04/25/2018
#


dir=`dirname "${0}"`
env=`awk -F = '/ENV/{print $2}' $dir/input.txt`
log_file=$dir"/log.txt"
OS=`uname`
HOST=`hostname`

#echo $dir
#echo $env
#echo $log_file
validate()
{
        input=$1
        #echo $input
        case $input in
                y)
                        #echo "Continue further"
                        return 1
                ;;
                n)
                        echo "Aborting activity."
                        exit 1
                ;;
                *)
                        echo "Invalid option. Please enter a valid choice. (y/n)"
                        return 0
                ;;
        esac

}

#Main body
case $OS in
    Linux)
        echo -e "#### This is $env server : $HOST\n####"
        echo -e "####      <<<$env Environment>>>> \n####\n"
        a=0
        while [ $a -eq 0 ]
        do
                echo -n "Do you really want to perform the activity on $HOST($env server)?(y/n) : "
                read inp1
                #echo $inp1
                validate $inp1
                a=$?
        done

        echo -e "\n#### CONFIRM AGAIN TO PROCEED."
        echo -e "#### This is $env server : $HOST\n####"
        echo -e "####      <<<$env Environment>>>> \n####\n"
        b=0
        while [ $b -eq 0 ]
        do
                echo -n "Please confirm again if you want to perform the activity on $HOST($env server)?(y/n) : "
                read inp2
                #echo $inp1
                validate $inp2
                b=$?
        done

        echo -ne "\n####\n####\n#### Please enter the ticket number(na if not available): "
        read inp3
        echo -ne "\n####\n####\n#### Please enter a short description of the activity : "
        read inp4
        echo -e "\n####\n####\n####             THIS IS $env ENVIRONMENT"

        echo -e "[`date +DATE:%m/%d/%y%tTIME:%H:%M:%S`]\t[`whoami`]\t[$inp3]\t[$inp4]" >> $log_file
    ;;
esac
