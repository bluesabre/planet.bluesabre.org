# planet.bluesabre.org

Feed aggregator for Xfce and Xubuntu releases. Powered by:

- [Kasper](https://github.com/rosario/kasper)
- [Jekyll](https://github.com/jekyll/jekyll)
- [Planet Pluto](https://github.com/feedreader/planet.rb)
- [mailman-rss](https://pypi.org/project/mailman-rss/) for processing xfce-announce

Updated frequently at [planet.bluesabre.org](https://planet.bluesabre.org)

## Adding Your Blog

1. Add your feed details to `planet.ini`.
1. If you want your feed to only show an excerpt (for rendering or other purposes), add your blog title to ~line 62 of `planet.rb`.

```ruby
if ['Sean Davis', 'My Blog Title'].include? item.feed.title
  frontmatter['excerpt_only'] = false
else
  frontmatter['excerpt_only'] = false
end
```

## Included Goodies

- `fetch-ubuntu-package.py` pulls the latest ubuntu changelogs for a list of packages, and parses them into Markdown
- `fetch-xfce-announce.py` uses `mailman-rss` to pull Xfce release announcements, then cleans them up and converts them into Markdown

## Installation

    # Jekyll dependencies
    git clone https://github.com/bluesabre/planet.bluesabre.org
    cd planet.bluesabre.org
    gem install jekyll bundler
    gem install jekyll-paginate
    
    # Pluto dependencies
    sudo apt-get install libsqlite3-dev
    gem install pluto
    
    # Processing xfce-announce
    sudo apt install python3-pip python3-lxml
    pip3 install mailman-rss
    
    # Correcting GitHub release dates
    sudo apt install sqlite3


## Configuration

### Planet Pluto Configuration

Add additional sources to planet.ini.

    title = Planet Ruby

    [rubylang]
        title = Ruby Lang News
        link  = http://www.ruby-lang.org/en/news
        feed  = http://www.ruby-lang.org/en/feeds/news.rss

Use the pluto command line tool and pass in the planet configuration.

    pluto update planet.ini

This will

1) fetch all feeds listed in `planet.ini` and

2) store all entries in a local database, that is, `planet.db` in your working folder.


### Generate Planet Posts

Use the planet.rb script to generate the blog posts for your static website.

    ruby ./planet.rb


This will

1) fetch the latest entries from the local database, that is, `planet.db` and

2) generate a blog story for every entry in `_posts/`


### Build and Serve

Build page and start local web server

    jekyll serve

Build page into `_site` folder

    jekyll build


## Copyright & License

Kasper Theme - Copyright (C) 2013 Ghost Foundation - Released under the MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
