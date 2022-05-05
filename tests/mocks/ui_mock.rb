class UIMock
  def echo(msg, color = nil)
    puts colorize(msg, color)
  end

  def error(msg)
    echo msg, 'red'
    exit(1)
  end
end
