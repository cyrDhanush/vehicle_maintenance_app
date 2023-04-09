import random as r

string='''General check-up and inspection
Engine oil change
Air filter cleaning or replacement
Brake system inspection and repair
Wheel alignment and balancing
Battery check and replacement
Suspension system inspection and repair
Transmission system service
Fuel system cleaning
Spark plug replacement
Coolant system flush and refill
Timing belt replacement
Power steering system service
AC system service and repair
Exhaust system inspection and repair'''

listt=string.split('\n')

for i in listt:
    print("'",i,"'",':' ,r.randrange(1000,5000),',', sep='')

for i in range(5):
    print('+91', r.randrange(9000000000,9999999999))