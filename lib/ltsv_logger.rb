require "forwardable"
require "logger"
require "time"
require "ltsv"

class LtsvLogger
  extend Forwardable
  include Logger::Severity

  VERSION = "0.0.0"

  def initialize(*args)
    @logger = Logger.new(*args)
  end

  def_delegators :@logger,
    :close, :level, :level=,
    :debug?, :info?, :warn?, :error?, :fatal?

  def debug(message_or_log_hash = nil, log_hash = nil, &block)
    add(DEBUG, message_or_log_hash, log_hash, &block)
  end

  def info(message_or_log_hash = nil, log_hash = nil, &block)
    add(INFO, message_or_log_hash, log_hash, &block)
  end

  def warn(message_or_log_hash = nil, log_hash = nil, &block)
    add(WARN, message_or_log_hash, log_hash, &block)
  end

  def error(message_or_log_hash = nil, log_hash = nil, &block)
    add(ERROR, message_or_log_hash, log_hash, &block)
  end

  def fatal(message_or_log_hash = nil, log_hash = nil, &block)
    add(FATAL, message_or_log_hash, log_hash, &block)
  end

  def add(severity, message_or_log_hash = nil, log_hash = nil, &block)
    if block_given?
      array_or_hash = yield
      if array_or_hash.respond_to?(:to_h)
        message_or_log_hash = array_or_hash
      else # as an Array
        message_or_log_hash, log_hash = *array_or_hash
      end
    end
    if message_or_log_hash.respond_to?(:to_h)
      output_data = message_or_log_hash.to_h
    else
      output_data = log_hash.to_h.merge(message: message_or_log_hash)
    end
    severity_string =
      @logger.send(:format_severity, severity) # call private method!
    output_data = output_data.merge(time: Time.now.iso8601(6),
                                    pid: Process.pid,
                                    severity: severity_string)
    @logger << LTSV.dump(output_data)
  end
end
