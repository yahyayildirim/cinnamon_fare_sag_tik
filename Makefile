build:
	: Lütfen make install komutunu çalıştırın.
install:
	mkdir -p $(HOME)/.local/share/nemo/actions/
	mkdir -p $(HOME)/.local/share/nemo/actions/scripts/

	install masaustu_kisayol_olustur.nemo_action $(HOME)/.local/share/nemo/actions/masaustu_kisayol_olustur.nemo_action
	install masaustu_kisayol_olustur.sh $(HOME)/.local/share/nemo/actions/scripts/masaustu_kisayol_olustur.sh

	install pdf_ayir.nemo_action $(HOME)/.local/share/nemo/actions/pdf_ayir.nemo_action
	install pdf_ayir.sh $(HOME)/.local/share/nemo/actions/scripts/pdf_ayir.sh

	install pdf_birlestir.nemo_action $(HOME)/.local/share/nemo/actions/pdf_birlestir.nemo_action
	install pdf_birlestir.sh $(HOME)/.local/share/nemo/actions/scripts/pdf_birlestir.sh

	install pdfye_donustur_tekli.nemo_action $(HOME)/.local/share/nemo/actions/pdfye_donustur_tekli.nemo_action
	install pdfye_donustur_coklu.nemo_action $(HOME)/.local/share/nemo/actions/pdfye_donustur_coklu.nemo_action
	install pdfye_donustur.sh $(HOME)/.local/share/nemo/actions/scripts/pdfye_donustur.sh

	install pdf_boyut_dusurme.nemo_action $(HOME)/.local/share/nemo/actions/pdf_boyut_dusurme.nemo_action
	install pdf_boyut_dusurme.sh $(HOME)/.local/share/nemo/actions/scripts/pdf_boyut_dusurme.sh

	install pdfye_ocr_uygula.nemo_action $(HOME)/.local/share/nemo/actions/pdfye_ocr_uygula.nemo_action
	install pdfye_ocr_uygula.sh $(HOME)/.local/share/nemo/actions/scripts/pdfye_ocr_uygula.sh
