#!/bin/bash
for i in 1 2   
do
    echo "Welcome $i times"
done

for car in bmw ford toyota missan
do
    echo "Value of car is :$car"
done

for command in date pwd df
   do
   echo
   echo "*** The output of $command command >"
   #run command
   $command
   echo
done
