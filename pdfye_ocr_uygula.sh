#!/bin/bash
#
#####################################
# PDF to OCR Scripti                #
# Yahya YILDIRIM                    #
# kod.pardus.org.tr/yahyayildirim   #
#####################################
#
dizin=`dirname "$1"`

#
# Dosyanın hangi isim ile kaydedileceğini sor
if ! DOSYA_ADI=$(zenity --entry \
  --title="PDF Dosyasına OCR (kopyalanabilir) Uygula" \
  --text="Yeni oluşacak pdf dosyasına bir isim verin." \
  --width=350); then
  exit 1
fi
#
# Dosyaları ayırmak için img2pdf programı kullanılacak
if [[ $DOSYA_ADI == "" ]]; then
  notify-send --expire-time=200000 "Dosya ismi boş olamaz. Tekrar deneyin."
  exit 1
elif [[ -e "$dizin/${DOSYA_ADI// /_}.pdf" ]]; then
  notify-send --expire-time=200000 "Aynı isimli dosya zaten var. Lütfen başka bir isim ile tekrar deneyin."
  exit 1
else
  # Resimden PDFye dönüştürdüğünüz dosyaların OCR işlemine tabi tutulması 
  ocrmypdf -l tur "$@" "$dizin/${DOSYA_ADI// /_}".pdf
  exit 0
fi
