pkg_name="feeder-import-workers"
pkg_version="0.4.2"
pkg_shasum="4f16892bd18f9336d2adfb4268dc0bdc036e38a1598004fe42de27dabb5ad215"
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
