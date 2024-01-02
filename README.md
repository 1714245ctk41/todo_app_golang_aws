# golang_api
Please refer to the newest repository instead, here:  
```
https://github.com/ydhnwb/golang_heroku
```


Trên Ubuntu hông có map DNS: `host.docker.internal`. Trên Mac OS Docker Desktop tự có setup DNS này

solution
1) tìm địa chỉ IP local của VPS: hostname -I. Lấy IP đầu tiên
root@ubuntu-s-1vcpu-2gb-amd-sgp1-01:~# hostname -I
146.190.109.138 10.15.0.5 10.104.0.2 172.17.0.1 172.18.0.1
2) Tạo container từ MySQL image
docker run -d --name=golang_api --network todo-app -v my-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DB=golang_api -p 3306:3306 96bc8cf3633b
3) Login vào MySQL image để tạo DB: golang_api
4) dùng flag --add-host để chạy container
docker run --add-host="host.docker.internal:146.190.109.138" -it -v ./:/app -p 8080:8080 33002f80fd01
