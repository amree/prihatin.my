# README

## Deployment

### First deployment

    mina setup
    vi prihatin/shared/env

In local development, run this command:

    mina deploy

After that, we need to manually start the app for the first time:

    cd prihatin/current
    for LINE in `cat /home/amree/prihatin/shared/env`; do export $LINE; done
    ./bin/pumactl -F config/puma.rb start

## Development Setup

* Copy `.env` to `.env.local` and modified it as necessary

### Heroku Setup

In `.git/config`:

```
[remote "heroku"]
  url = https://git.heroku.com/projekderma.git
  fetch = +refs/heads/*:refs/remotes/heroku/*
```

## Manual Tasks for Campaign in Production

* Put the Billplz API key manually in organizer's table
* Make sure to create collection first and put the id in campaign's table
