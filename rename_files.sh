for (( c=1; c<=$1; c++ ))
do
        b="rohit.txt."$c
        touch $b
done

+++++++++++++++++++++++++++++++++++++

ls -ltr|grep -e "rohit.txt.[1-9]"|awk '{system("mv "$NF" "$NF"_bckup"" && gzip "$NF"_bckup")}'