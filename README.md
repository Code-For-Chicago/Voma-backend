# Voma is Code for Chicago's custom **vo**lunteer **ma**nagement system.

At a high level we're trying to achieve the following:
1. Facilitate a smooth process from attending onboarding night to setting up a 1x1 with a project lead
2. Better identify and develop our volunteer's skillsets - where do our skills currently align and where do we want them to go?
3. Integrate with our existing tools (Meetup, Slack, Trello, etc.)
4. Better visualize the scope of our members through skill dashboards and other visualizations
5. Automate whenever possible to reduce bottlenecks in onboarding 

## Tech Stack

React  
Ruby on Rails  
PostgreSQL  

## Planned Integrations 
Slack  
Meetup  
Trello  

## Scope of MVP

1. New Member completes onboarding form (modeled after current Google Form)
2. System generates user profile based on input
3. Project Leads review new volunteers and set up 1x1s / assign to projects

## Repositories
[Front End](https://github.com/Code-For-Chicago/Voma-frontend)  
[Back End](https://github.com/Code-For-Chicago/Voma-backend)

## How to Contribute Guide
[How to Contribute to Voma](How-to-Contribute.md)

## How to run the API using Docker

1. The first thing you'll need to do is install the service on you machine. These [installation instructions](https://docs.docker.com/engine/install/) over at the docker docs site are handy for this part. 
  - If you're using Windows I highly advise setting up Windows Subsystem for Linux using version 2 or greater. Doing this will make it so our makefile works in your environment and overall just makes it easier to interact with Docker. Luckily, Docker has also provided a [guide for getting this setup](https://docs.docker.com/docker-for-windows/wsl/).
2. Clone this repo! You can do that by running `git clone https://github.com/Code-For-Chicago/Voma-backend.git` in the terminal application of your choice where ever you want the files to end up.
3. Try running `make build`
  - If this is successful you should see some output like this:
```
$ make build
docker-compose build
db uses an image, skipping
Building web
[+] Building 13.0s (17/17) FINISHED
 => [internal] load build definition from railsServer.Dockerfile                                                     0.0s
 => => transferring dockerfile: 536B                                                                                 0.0s
 => [internal] load .dockerignore                                                                                    0.1s
 => => transferring context: 2B                                                                                      0.0s
 => resolve image config for docker.io/docker/dockerfile:1                                                          10.9s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:9e2c9eca7367393aecc68795c671f93466818395a2693498debe  0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => [internal] load build definition from railsServer.Dockerfile                                                     0.0s
 => [internal] load metadata for docker.io/library/ruby:3                                                            1.6s
 => [1/8] FROM docker.io/library/ruby:3@sha256:3dbe82eca4730c28fe42929470249ec412ccf17405eaf55efa6427b9d6c171de      0.0s
 => [internal] load build context                                                                                    0.0s
 => => transferring context: 6.26kB                                                                                  0.0s
 => CACHED [2/8] RUN apt-get update -qq && apt-get install -y nodejs postgresql-client                               0.0s
 => CACHED [3/8] WORKDIR /voma                                                                                       0.0s
 => CACHED [4/8] COPY Gemfile /voma/Gemfile                                                                          0.0s
 => CACHED [5/8] COPY Gemfile.lock /voma/Gemfile.lock                                                                0.0s
 => CACHED [6/8] RUN bundle install                                                                                  0.0s
 => CACHED [7/8] COPY entrypoint.sh /usr/bin/                                                                        0.0s
 => CACHED [8/8] RUN chmod +x /usr/bin/entrypoint.sh                                                                 0.0s
 => exporting to image                                                                                               0.0s
 => => exporting layers                                                                                              0.0s
 => => writing image sha256:34d3e8e3664943455a5e0cd2b2491c7c341783382f8ffc76ad4e979345947f30                         0.0s
 => => naming to docker.io/library/voma-backend_web                                                                  0.0s
 1
 ```
 4. Make sure you can start the thing! You can do that by running `make start` or if you'd like to see live output in your terminal you can run `make start-nobackground`. This should give you output like this:
 ```
$ make start
docker-compose up -d
voma-backend_db_1 is up-to-date
Recreating voma-backend_web_1 ... done
 ```

 ## Makefile targets

 - `make start` : This starts the API by spinning up two containers, DB and web. It will run in the background using the `-d` flag for `docker-compose`
 - `make start-nobackground` : This starts the api by spinning up two containers, DB and web. This will run in the foreground of your terminal and you'll see container output there. This is sometimes handy for debugging.
 - `make stop` : This will stop the running containers
 - `make rspec` : This will run rspec tests (unit tests)
 - `db_dev_migrate` : This will create and migrate the development database
 - `db_dev_drop` : This will delete the development database
 - `db_dev_reset` This will delete and then create a new development database