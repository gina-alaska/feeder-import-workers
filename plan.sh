pkg_name="feeder-import-workers"
pkg_version="0.4.1"
pkg_shasum="56694e6730bf12c63931400c4361bcbd7e600297af88d8e62bbd27a31f643996"
pkg_origin="uafgina"
pkg_maintainer="UAF GINA <support+habitat@gina.alaska.edu>"
pkg_license=('MIT')
pkg_source="https://github.com/gina-alaska/${pkg_name}/archive/${pkg_version}.tar.gz"
pkg_deps=(
  uafgina/conveyor
)
pkg_build_deps=(
  core/gcc
  core/make
  core/libffi
  uafgina/conveyor
)

do_build() {
 return 0
}

do_install() {
  cp -R workers/ ${pkg_prefix}/workers
}
