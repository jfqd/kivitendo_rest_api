%w(
  .ruby-version
  .rbenv-vars
  .rvmrc
  tmp/restart.txt
  tmp/caching-dev.txt
).each { |path| Spring.watch(path) }
