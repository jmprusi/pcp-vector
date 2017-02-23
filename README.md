1 - Run on target host:

```
    docker run -d --privileged --net=host --pid=host --ipc=host -v /sys:/sys:ro -v /etc/localtime:/etc/localtime:ro -v /var/lib/docker:/var/lib/docker:ro -v /run:/run -v /var/log:/var/log -v /dev/log:/dev/log --name=pcp-vector jmprusi/pcp-vector
```

2 - Point your browser to http://$HOST:9000


