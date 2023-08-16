echo "Hello World"
ls -altr


full_end_time=$(( $(date +%s) + 5400 ))
while [ $(date +%s) -lt $full_end_time ]; do
    current_time=$(date +%s)
    end_time=$(( $current_time + 60 ))
    echo "Printing this message every 1 minute."
    echo "time $(date +%s) : $full_end_time"

    while [ $(date +%s) -lt $end_time ]; do
        a=21
    done   
done