load 'script.sh'

@test "addition function" {

  original_result=$(addition 2 3)
  
    run addition 2 3 
  
  [ $output -eq $original_result ]

}

@test "subtraction function" {

  original_result=$(subtraction 5 3) 
  
  run subtraction 5 3
  
  [ $output -eq $original_result ] 

}

@test "main flow" {

  expected_output=$(./script.sh test-input.txt)
  
  run ./script.sh test-input.txt

  [ $output == $expected_output ]

}
