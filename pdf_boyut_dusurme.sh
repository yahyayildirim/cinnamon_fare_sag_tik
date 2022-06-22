#!/bin/bash
 
# http://www.alfredklomp.com/programming/shrinkpdf
# Licensed under the 3-clause BSD license:
#
# Copyright (c) 2014-2019, Alfred Klomp
#!/bin/bash

#####################################
# PDF Ayırma Scripti                #
# Yahya YILDIRIM                    #
# kod.pardus.org.tr/yahyayildirim   #
#####################################

dizin=`dirname "$1"`

# Dosyanın hangi isim ile kaydedileceğini sor
if ! DOSYA_ADI=$(zenity --entry \
  --title="PDF Dosyasının Boyutunu Küçültme" \
  --text="Yeni oluşacak pdf dosyalarına bir isim verin." \
  --width=300); then
  exit 1
fi

# Dosyaları ayırmak için pdfseparate programı kullanılacağız
#pdftk "$@" cat output "$dizin/$DOSYA_ADI.pdf" ;
if [[ $DOSYA_ADI == "" ]]; then
  notify-send --expire-time=200000 "Dosya ismi boş olamaz. Tekrar deneyin."
  exit 1
elif [[ -e "$dizin/"${DOSYA_ADI// /_}".pdf" ]]; then
  notify-send --expire-time=200000 "Aynı isimli dosya zaten var. Lütfen başka bir isim ile tekrar deneyin."
  exit 1
else
  notify-send --expire-time=200000 "PDF dosyası başarılı bir şekilde sayfalara ayrıldı."
  
  # -dPDFSETTINGS=/screen   (screen-view-only quality, 72 dpi images)
  # -dPDFSETTINGS=/ebook    (low quality, 150 dpi images)
  # -dPDFSETTINGS=/printer  (high quality, 300 dpi images)
  # -dPDFSETTINGS=/prepress (high quality, color preserving, 300 dpi imgs)
  # -dPDFSETTINGS=/default  (almost identical to /screen)

  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$dizin/${DOSYA_ADI// /_}".pdf "$@"
  exit 0
fi