echo "Hello World"
ls -altr

end_time=$(( $(date +%s) + 30 ))

while [ $(date +%s) -lt $end_time ]; do
    echo "Doing something ...."
    echo "time $(date +%s) : $end_time"
done