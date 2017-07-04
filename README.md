# README

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
