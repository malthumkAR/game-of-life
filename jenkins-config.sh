app_tag=`git ls-remote https://github.com/malthumkAR/game-of-life.git HEAD | awk '{print $1}'`

docker_app="vinod9782/ola:$app_tag"
docker build -t $docker_app .

docker login -u vinod9782 -p yourpassword 

docker push $docker_app

scp -i /var/lib/jenkins/dev.pem deploy.sh root@:172.31.45.255/tmp

ssh -i /var/lib/jenkins/dev.pem root@172.31.45.255 chmod +x /tmp/deploy.sh

ssh -i /var/lib/jenkins/dev.pem root@172.31.45.255 /tmp/deploy.sh $docker_app
