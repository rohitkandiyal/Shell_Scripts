

############################################################################

#for loop basics:



for i in {1..5}
do
   echo "Welcome $i times"
done

#Output:
#Welcome 1 times
#Welcome 2 times
#Welcome 3 times
#Welcome 4 times
#Welcome 5 times

for (( c=1; c<=5; c++ ))
do
   echo "Welcome $c times"
done

#Output:
#Welcome 1 times
#Welcome 2 times
#Welcome 3 times
#Welcome 4 times
#Welcome 5 times

############################################################################
#Fetching params

for var in "$@"
do
    echo "$var"
done

#Output:
#a
#b
#c

for var in "$#"
do
    echo "$var"
done
#Output:
#3


declare -i a=$#						#to declare integer var... still iteration doesn't happen
for i in {1..$a}
do
   echo "Welcome $i times"
done

#works like this:

declare -i a=$#

for (( c=1; c<=$a; c++ ))			#for (( c=1; c<=$#; c++ )) ALSO WORKS
do
   echo "Welcome $c times"
done

#Output:
#[root@ansible rough]# bash 1.sh a b c d
#Welcome 1 times
#Welcome 2 times
#Welcome 3 times
#Welcome 4 times



############################################################################

$ a=2
$ echo "$a + 1"
2 + 1
$ echo "$(($a + 1))"
3

You should be aware that bash (as opposed to ksh93, zsh or yash) only performs integer arithmetic. 
If you have floating point numbers (numbers with decimals), then there are other tools to assist. For example, use bc:

$ b=3.14
$ echo "$(($b + 1))"
bash: 3.14 + 1: syntax error: invalid arithmetic operator (error token is ".14 + 1")
$ echo "$b + 1" | bc -l
4.14

############################################################################

#break

for i in {1..5}
do
   echo "Welcome $i times"
   if [ "$i" == 2 ]; then
		break
   fi
done

#Output:
#Welcome 1 times
#Welcome 2 times

#continue

for i in {1..5}
do
   echo "Welcome $i times start"
   if [ "$i" == 2 ]; then
        continue
   fi
   echo "Welcome $i times stop"
done

#output:
#Welcome 1 times start
#Welcome 1 times stop
#Welcome 2 times start
#Welcome 3 times start
#Welcome 3 times stop
#Welcome 4 times start
#Welcome 4 times stop
#Welcome 5 times start
#Welcome 5 times stop


