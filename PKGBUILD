# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=rider-eap
_buildver=163.1408
_pkgver=1.0
_eap="True"
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
pkgdesc="A cross-platform C# IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/"
license=("custom")
optdepends=('mono: .NET runtime')
# makedepends=("wget")
provides=("rider")
conflicts=("rider")
groups=("development" "IDE" "editor" "jetbrains")

source=("file://riderRS-${_buildver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('441dee78375671249434e4338613ec37c295f217190932ed5515c05164eb7264'
            'e2782e2af1b0fb35c4fcf7c53fde1d215a069b027818ad125b2cb0bc0481dbfc')

package() {
    cd "${srcdir}"
    install -dm 755 \
        "${pkgdir}/opt/${pkgname}" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/licenses/${pkgname}/" \
        "${pkgdir}/usr/share/applications/"

    if [[ "True" = "${_eap}" ]]; then
        cp -R --no-preserve=ownership "${srcdir}/riderRS-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
    # else
    fi

    if [[ "i686" = "${CARCH}" ]]; then
        rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
        rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
    fi

    sed -i "s/Version=/Version=${pkgver}/g" "${pkgname}.desktop"
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

    ln -s "/opt/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/rider-eap"
}

