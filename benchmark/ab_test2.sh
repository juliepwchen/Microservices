cat kurls.txt | parallel "ab -n 10000 -c 10 {}"
