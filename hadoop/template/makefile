
IMAGE_NAME = nic-hadoop-master

build:
	docker build -t $(IMAGE_NAME) .
save:
        #SF=`date "+%Y%m%d%H%M%S"`
	docker save $(IMAGE_NAME) > target/${IMAGE_NAME}-${SF}.tar
