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

## 🚀 Setup

**Install Ruby**

https://www.ruby-lang.org/en/documentation/installation/

**Install PostgreSQL**

https://formulae.brew.sh/formula/postgresql

**Install rbenv for environment management**

https://github.com/rbenv/rbenv

### Getting Started
1. Download the repo `git clone git@github.com:Code-For-Chicago/Voma-backend.git`
2. Make sure the correct version of Ruby is installed using `rbenv`:
```
rbenv init
rbenv install 2.7.1
rbenv rehash
```
3. Install the dependencies from the Gem file:\
`bundle install`
4. Set up the postgres DB:\
`rake db:setup`
5. Start up the app:\
`rails s`

### Troublshooting
Some issues can arrise if you have different versions of Ruby installed or if you previously weren't using `rbenv`. Some helpful troubleshooting steps are:
- checking which version of Ruby you are using:\
`ruby -v`
- seeing where the ruby executable is being run from (should be in `.rbenv`):\
`which ruby`
- checking which `rbenv` versions are installed:\
`rbenv versions`
- seeing which gems are installed:\
`gem list`
- checking `rbenv local` and `rbenv global` to make sure they are the correct versions
- running `ruby rehash` which installs shims for all Ruby executables. This usually needs to be done after installing new versions of Ruby or installing a gem that provides commands
- restarting PostgreSQL using brew:\
`brew services restart postgresql`
