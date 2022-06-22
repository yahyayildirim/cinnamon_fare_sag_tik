#!/bin/bash
#
#####################################
# PDF Birleştirme Scripti           #
# Yahya YILDIRIM                    #
# kod.pardus.org.tr/yahyayildirim   #
#####################################
#
dizin=`dirname "$1"`

#
# Dosyanın hangi isim ile kaydedileceğini sor
if ! DOSYA_ADI=$(zenity --entry \
  --title="PDF Sayfalarını Birleştirme" \
  --text="Yeni oluşacak pdf dosyasına bir isim verin." \
  --width=300); then
  exit 1
fi
#
# Dosyaları ayırmak için pdfseparate programı kullanılaca
#pdftk "$@" cat output "$dizin/$DOSYA_ADI.pdf" ;
if [[ $DOSYA_ADI == "" ]]; then
  notify-send --expire-time=200000 "Dosya ismi boş olamaz. Tekrar deneyin."
  exit 1
elif [[ -e "$dizin/"${DOSYA_ADI// /_}"_1.pdf" ]]; then
  notify-send --expire-time=200000 "Aynı isimli dosya zaten var. Lütfen başka bir isim ile tekrar deneyin."
  exit 1
else
  notify-send --expire-time=200000 "PDF dosyası başarılı bir şekilde sayfalara ayrıldı."
  pdftk "$@" cat output "$dizin/${DOSYA_ADI// /_}.pdf"
  exit 0
fi
