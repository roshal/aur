# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mastodon-docker-git
pkgver=1.0_584_g1c351709
_branch=master
pkgrel=1
pkgdesc="A GNU Social-compatible microblogging server"
arch=('i686' 'x86_64')
url="https://mastodon.social"
license=('AGPL-3.0')
conflicts=("${pkgname%-docker-git}", "${pkgname%-docker-git}-git", "${pkgname%-git}")
source=("git://github.com/tootsuite/${pkgname%-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

