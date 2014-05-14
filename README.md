# Yawl Rails

This is the UI and Rails integration component of [yawl](https://github.com/ricardochimal/yawl)

## Install Migrations

```
rake yawl_rails:install:migrations
```

Review the generated migrations then migrate:

```
rake db:migrate
```

## Routing

I like to mount the engine at the root, so the following would work but you can also mount it anywhere you see fit.

```
mount YawlRails::Engine, at: "/"
```

## Config

Extra config variables added:

* `Yawl::Config.pagination_per_page`: Number of processes to list per page

## Templates

It's currently setup so that you need to use haml in `yawl_rails` and assumes that you want to share your layout with it to maintain an integrated look.  One caveat is that it's using bootstrap 2--*maybe a rails4 only engine + bootstrap 3 is in the future?*.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
