## ThoughtWorks Docker Image: aptcacher

[![](http://dockeri.co/image/baselibrary/aptcacher)](https://registry.hub.docker.com/u/baselibrary/aptcacher/)

### Base Docker Image

* `latest`: aptcacher 1.7
* `1.7`   : aptcacher 1.7

### Installation

    docker pull baselibrary/aptcacher

### Usage

    docker run -it -p 3142:3142 -v $(pwd)/cache:/var/cache/apt-cacher:rw baselibrary/aptcacher
