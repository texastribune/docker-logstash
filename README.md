#### Build:

```
docker build --tag=texastribune/logstash .
```

or

```
make build
```

#### Run:

```
docker run --detach=true --publish=514:514 --publish=5000:5000 texastribune/logstash
```

or

```
make run
```


(I like to use the long version of the parameters because it's easier for me remember what they mean.)
