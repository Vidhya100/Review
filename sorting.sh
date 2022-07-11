#!/bin/bash -x

echo "Enter the number1 value: "
read num1
echo "Enter the number2 value: "
read num2
echo "Enter the number3 value: "
read num3

declare  -A comp

function sort()
{
	compute=$((num1+(num2*num3)))
	comp[first]="$compute"
	compute1=$(((num1*num2)+num3))
	comp[sec]="$compute1"
	compute2=$((num3+(num1/num2)))
	comp[third]="$compute2"
	compute3=$(((num1%num2)+num3))	comp[four]="$compute3"

	echo "${comp[@]}"

	for (( i=0 ; i < ${#comp[@]}; i++ ))
	do
    		for (( j=0 ; j < ${#comp[@]}; j++ ))
    		do
      			if [[ ${comp[$j]} -lt  ${comp[$i]} ]]
      			then
        			tmp=${comp[$i]}
        			comp[$i]=${comp[$j]}
  		      		comp[$j]=${tmp}
      			fi
    		done
	done

	for n in "${comp[@]}"
	do
    		echo "$n"
	done

	 for (( i=0 ; i < ${#comp[@]}; i++ ))
        do
                for (( j=0 ; j < ${#comp[@]}; j++ ))
                do
                        if [[ ${comp[$j]} -gt  ${comp[$i]} ]]
                        then
                                tmp=${comp[$i]}
                                comp[$i]=${comp[$j]}
                                comp[$j]=${tmp}
                        fi
                done
        done

        for n in "${comp[@]}"
        do
                echo "$n"
        done

}
sort
