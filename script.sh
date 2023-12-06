#!/bin/bash

addition() {
  echo $(($1 + $2))
}

subtraction() {
  echo $(($1 - $2)) 
}

process_file() {
  input_file=$1
  
  while read -r line; do
    name=$(echo $line | cut -f1 -d ' ')
    math_op=$(echo $line | cut -f2 -d ' ')
    num1=$(echo $line | cut -f3 -d ' ')
    num2=$(echo $line | cut -f4 -d ' ')
    
    if [ "$math_op" = "add" ]; then
      addition $num1 $num2
    elif [ "$math_op" = "subtract" ]; then 
      subtraction $num1 $num2
    fi

  done < $input_file
}

if [ "$1" != "" ]; then
  process_file $1 
fi
