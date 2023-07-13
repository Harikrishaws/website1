Using ack:

    Desktop $ purge && time ack -c '0' 100MB.txt 
    1
    
    real        0m2.146s
    user        0m0.327s
    sys         0m0.615s

Using Objective-C (read the whole string at once):

    Release $ purge && time ./MBtest
    2012-10-28 14:57:56.755 MBtest[3730:707] Found 104857600 characters
    
    real        0m2.425s
    user        0m0.898s
    sys         0m0.441s

Using Objective-C (memory-mapped file):

    Release $ purge && time ./MBtest
    2012-10-28 16:00:25.430 MBtest[4187:707] Found 104857600 characters
    
    real        0m2.285s
    user        0m0.583s
    sys         0m0.437s