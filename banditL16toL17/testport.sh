#!/bin/bash

touch /tmp/myscript/result.txt
echo "BEGIN" > /tmp/myscript/result.txt

for i in {31000..32000}
        do

            echo $i

            echo "Le resultat est :"

            result=$(openssl s_client -connect localhost:$i)

            echo "\n"

            if echo "$result" | grep -q CONNECTED;then

                    echo "The port $i is open for TLS connection" >> /tmp/myscript/result.txt #CHANGE THE SHARE IF YOU NEED

            else

                    echo "The port $i is not open"

            fi
        done
