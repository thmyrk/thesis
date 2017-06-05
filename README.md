# Introduction
This is a thesis concluding my studies for a title of Engineer of Computer Science. It's titled
"NoSQL databases in the context of web application servers". In this repo you can find all the
programs I've written for the thesis as well as the written thesis itself, which unfortunately is available
only in Polish. Apps are written using Ruby on Rails framework.

Below you can find enough information to correctly run the applications.
Commands presented were tested on Ubuntu 16.04

# Environment installation:
  1. Ruby 2.3.0
    Ruby language can be easily installed using RVM tool:
      `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
      \curl -sSL https://get.rvm.io | bash -s stable`

    Now to install the Ruby itself:
      `rvm install 2.3.0`
      `rvm use 2.3.0 --default`

    Next step is to install Bundler gem, which is a gem management tool.
      `gem install bundler`

  2. MySQL
    Most of the programs require a working MySQL database. To install it execute following command:
      `sudo apt-get install mysql-server mysql-client`

# Squeaker

  1. Install gems:
    `bundle`

  2. Install Cassandra:
    `sudo apt-get install cassandra=3.0.5`

  3. Configure Cassandra:
    `rake cequel:init`
    `rake cequel:migrate`

# RedisBoard

  1. Install gems:
    `bundle`

  2. To download and install Redis:
    `wget http://download.redis.io/releases/redis-3.2.0.tar.gz`
    `tar -xzf redis-3.2.0.tar.gz`
    `cd redis-3.2.0`
    `make`
    `make install`

  3. Launch Redis server
    `redis-server`

# MongoShop

  1. Install gems:
    `bundle`

  2. Install MongoDB:
    `sudo apt-get install mongodb-org`

# Neo4j

  1. Install gems:
    `bundle`

  Neo4j database is included into the project so there is no need to install it.
