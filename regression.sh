@test "Install package" {
  run sudo apt-get install apache2

  [ $status -eq 0 ]
}

@test "Apache service" {
  run systemctl status apache2

  [ $(echo $output | grep "active (running)")" != "" ]  
} 

@test "Server response" {
  response=$(curl localhost)

  echo $response | grep "It works!"
}

@test "Config file" {
  contents=$(cat /etc/apache2/apache2.conf)
  
  echo $contents | grep "KeepAlive On"
}
