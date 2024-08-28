rem version
tesseract --version
rem  list language
tesseract --list-langs
rem using Traditional Chinese  and  write into "output".txt file
tesseract path_to_your_image.png output -l chi_tra
rem english  and  write into "output".txt file
tesseract path_to_your_image.png output -l eng
rem using Traditional Chinese +  eng
tesseract path_to_your_image.png output -l eng+chi_tra
