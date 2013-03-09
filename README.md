# LtsvLogger

## Installation

Add this line to your application's Gemfile:

    gem 'ltsv_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ltsv_logger

## Usage

### Normal case

    require "ltsv_logger"
    logger = LtsvLogger.new(STDOUT)
    a = 2
    logger.info(message: "double a", a: a, double_a: a * 2)
    logger.info("triple of a", a: a, triple_a: a * 3)
    logger.info {
      {message: "double a", a: a, double_a: a * 2}
    }
    logger.info {
      ["triple a", a: a, triple_a: a * 3]
    }

## License

X11 License.
See LICENSE.txt for more information.

### Why X11 License?

You can see following URI:
http://www.gnu.org/licenses/license-list.en.html#X11License

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
