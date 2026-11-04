while true;do

        cd /tmp/myfiles/ #CHANGE DIRECTORY HERE

        f=$(ls -1 | head -n1)

        t=$(file -b "$f")

        if echo "$t" | grep -q gzip; then

                mv "$f" "$f.gz"
                gunzip "$f.gz"

        elif echo "$t" | grep -q bzip; then

                mv "$f" "$f.bz"
                bunzip2 "$f.bz"

        elif echo "$t" | grep -q tar; then

                tar -xf "$f"
                rm -f "$f"


        elif echo "$t" | grep -q ASCII; then

                echo "GOOD WE FOUND IT"
                cat "$f"
                break
        else
                echo "Unknown Type"
                break
        fi
done
