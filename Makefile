all: build-images

build-images:
	cd db && sudo docker build -t suixo/tlsarchiver_db .
	cd tls-archiver-front && sudo docker build -t suixo/tlsarchiver_front .
	cd tls-archiver && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-s' -o archiver .
	cd tls-archiver && sudo docker build -t suixo/tlsarchiver .

upload: build-images
	sudo docker push suixo/tlsarchiver_db
	sudo docker push suixo/tlsarchiver_front
	sudo docker push suixo/tlsarchiver

package-images: build-images
	mkdir out_images -p
	sudo docker save -o out_images/db.tar suixo/tlsarchiver_db
	sudo docker save -o out_images/front.tar suixo/tlsarchiver_front
	sudo docker save -o out_images/archiver.tar suixo/tlsarchiver
	sudo tar -cvaf images.tar.gz out_images docker-compose.yml

clean:
	sudo docker-compose rm -f
	rm tls-archiver/archiver
	rm -rf out_images
