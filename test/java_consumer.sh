test()
{
    docker run --name test -v $HOME/workspace/lib/jvm/java-1.8-openjdk:/usr/lib/jvm/java-1.8-openjdk -v $HOME/workspace:/workspace --network host wangziling100/jre bash /workspace/origin/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning &
    sleep 5
    pid=$(echo "$(docker exec test ps -a)"|grep "java")
    #echo $pid
    sleep 2
    docker container rm -f test
    if [[ -z $pid ]]; then
        return 1
    else
        return 0
    fi
}
test
