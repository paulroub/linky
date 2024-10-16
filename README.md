# linky

Work-in-progress linktree-esque theme, aiming for easy integration with Decap CMS.

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "linky"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: linky
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linky

## Usage

Use the [links layout][ll] on any page (including the home page) to display a list of all items in the `links` collection. Any additional content
within your page will be displayed after the list.

The `links` collection is defined by individual files in the `_links` folder. Only the YAML frontmatter of these files will be used; content
is unnecessary and will be ignored.

You will need to add a `links` collection to your Jekyll config, which is as simple as adding

```yml
collections:
    - links
```

to your `_config.yml` (see this repo's [config][config] for an example).


## Configuration

### Subhead(s)

In addition to your site's title (always displayed at the top of the links page), you can define one or more "subhead" lines to display just below the title.

These are defined as a `subheads` list in `_config.yml`:

```yml
subheads:
    - "A Linktree-esque Jekyll theme, compatible with Decap CMS."
    - "Probably more I could say here."
```

### Colors

You can override the color scheme of a Links page by adding a `linky` section to your `_config.yml` (see [the example in this repo][config]) and
setting one or more of these values:

```yml
linky:
    body_background: "#fa0616"
    body_foreground: "#f0f0f0"
    button_foreground: "#f16293"
    button_background: "#f16293"
```

These alter the page's background and foreground, and the background and foreground of each link "button".


### Link Metadata

A link item is defined using the following fields:

```
---
link: "https://example.com/"
image: "/images/example.jpg"
title: 'My link test'
priority: 5
expires: 2024-11-11
---
```

- `link`

    This is the target of our link. Both the image and text will point to this address. It can be a full URL or a relative
    URL to another page on your site.

- `image`

    The URL of an image to prefix the link. This should be an image on your site, to be safe -- but you *can* reference an external image.
    Note that the image will be displayed at a small size (3.5em in the default styles) and cropped to a circular shape.

- `title`

    The text to display in our link entry. Shorter text will look cleaner, but there's no arbitrary limit.

- `priority`

    Links are sorted by numerical priority (*i.e.* 1 comes first), then by `title`.

- `expires`

    A date after which this link should no longer be displayed.

    Note that this will only take effect on a rebuild; there's no runtime JavaScript, etc. to disable a link that's already been deployed.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paulroub/linky. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.


## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[ll]: https://github.com/paulroub/linky/blob/main/_layouts/links.html
[config]: https://github.com/paulroub/linky/blob/main/_config.yml
