# App role for app instance
class roles::app {
  include ::profiles::golang
  include ::profiles::go_webapp::run
  include ::profiles::base
}
