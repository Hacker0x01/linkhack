# LinkHack

A simple link shortener designed to run on an internal network to share resources and provide easy references to specific items within a domain. At the moment it supports super basic parameterization and not much else.

# Development

## Getting started

```
bin/bundle install
bin/rails db:create
bin/rails db:schema:load
```

## Running specs

Make sure your local environment is set up, see "Getting started".

```
bin/bundle exec rspec
```

## Future Work
There are loads of things I'd like to make LinkHack do, and ultimately there are probably a whole whack of ideas that other people are going to have that are way better than anything I come up with. So I'll maintain a list here of my personal favourites both to give a sense of where this is going, and so that those that are interested in contributing have some suggestions if they don't have anything specific in mind.

- Dockerize the application
- Link pagination. Seems like it might be useful eventually.
- Slack integration. Still working out exactly how to do this, but it'd be great if go/foo turned into a clickable link in slack. There are some other things that could be built (or just configured in slack) as well, like link creation through /commands and inline previews.
- Chrome search engine integration. I've heard that you can make it so that chrome can do intelligent autocompleting if you set up the correct endpoint for it to discover. I'll need to figure out how this works.
- Better documentation. Sorry.
- More robust/intelligent parameterization. I've got some ideas for this but I'm totally open to suggestions.
- Better handling of redirect loops.
