# Maintainer: KillWolfVlad <github.com/KillWolfVlad>

pkgname=('gitahead')
pkgrel=1
pkgver=1.4.8
pkgdesc='THE MOST POWERFUL GIT GUI'
url='http://gitahead.scitools.com/'
provides=('gitahead')
conflicts=('gitahead')
arch=('x86_64')
license=('custom')
depends=('qt5-base')
source=(
  "gitahead-${pkgver}.bin::https://gitahead.com/downloads/v${pkgver}/GitAhead-${pkgver}.sh"
  "gitahead-license"
  "gitahead.desktop"
  "gitahead.png"
  "gitahead.sh"
)
sha256sums=('faf5af11739f610e1be9aa32b3572409d385705e103225f1e9c426968d544181'
            'd71bfb48c954d213986816fc29478c7f80c8bd2dd10d2889bf51897d649eedd6'
            '6070ebf6752f55f8b7d8a79107ce491c3acf04310eeb9a8242b83cfb4df055f2'
            '66cb53fc57eb2ce2e6cd02ff392476fdfb91b723b76ef5da1856e9b5dc1b5c75'
            'eb9f2de75d533bb1b20affe439e4bd4013511ce32829ca41e37064ef9051dd61')

prepare() {
  tail -n +224 gitahead-${pkgver}.bin > gitahead-${pkgver}.tar.gz
  mkdir -p gitahead-${pkgver}
  bsdtar xvf gitahead-${pkgver}.tar.gz -C gitahead-${pkgver}
}

package() {
  install -d "${pkgdir}/opt/gitahead"
  cp -R "${srcdir}/gitahead-${pkgver}/Resources" "${pkgdir}/opt/gitahead"
  find "${pkgdir}/opt/gitahead/" -type f -exec chmod 644 {} \;

  install -D -m755 "${srcdir}/gitahead-${pkgver}/GitAhead" "${pkgdir}/opt/gitahead/GitAhead"
  install -D -m755 "${srcdir}/gitahead-${pkgver}/indexer" "${pkgdir}/opt/gitahead/indexer"
  install -D -m755 "${srcdir}/gitahead-${pkgver}/relauncher" "${pkgdir}/opt/gitahead/relauncher"

  install -D -m644 "${srcdir}/gitahead-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/gitahead.sh" "${pkgdir}/usr/bin/gitahead"
  install -D -m644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"
  install -D -m644 "${srcdir}/gitahead.png" "${pkgdir}/usr/share/pixmaps/gitahead.png"
}
