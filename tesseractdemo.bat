rem version
tesseract --version
rem using Traditional Chinese  and  write into "output".txt file
tesseract path_to_your_image.png output -l chi_tra
rem english  and  write into "output".txt file
tesseract path_to_your_image.png output -l eng
