pkg_name="feeder-import-workers"
pkg_version="0.4.0"
pkg_shasum="f427c72d31d3d1671948e4494c404db09d1b76c08a4592e1877f8653a6c643a7"
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
