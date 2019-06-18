import re
import os
import io
import sys
import csv
import cv2 as cv
import pytesseract
import numpy as np
from PIL import Image
from subprocess import Popen, PIPE

# Displays the image
def show(title, img):
	cv.imshow(title,img)
	key = cv.waitKey(0)
	cv.destroyAllWindows()

def convert(folder, image, ext):
	name = image.split('.')[0]
	
	print "Converting "+image+" to "+name+".jpg"
	try:
		if ext=='png':
			img = cv.imread(folder+image)
			cv.imwrite(folder+name+'.jpg', img)

		elif ext=='gif':
			img = Image.open(folder+image)
			img.convert('RGB').save(folder+name+'.jpg')

		print "\t DONE"
		os.system('rm '+folder+image)
	except:
		print "\t FAIL"

def resize(folder, files):
	print "\n\n"
	for image in files:
		print "Resizing "+image
		try:
			img = cv.imread(folder+image)

			if img.shape[1]>img.shape[0]:
				img = cv.resize(img, (900,600))
			else:
				img = cv.resize(img, (600,900))

			os.system('rm '+folder+image)
			cv.imwrite(folder+image, img)
		except:
			print "\t FAIL"

def normalize(folder, files):
	for image in files:
		ext = image.split('.')[1]
		if not ext=='jpg':
			convert(folder, image, ext)
	files = os.listdir(folder)

	resize(folder, files)
	return files


def image_to_string(folder, jpg_images): 
	results = []
	for image in jpg_images:
		print "Processing ", image
		try:
			text = pytesseract.image_to_string(Image.open(folder+image))
			results.append(text)
		except:
			print "\t FAIL"

	return results


if __name__ == '__main__':
	folder = sys.argv[1].strip('/')
	folder = folder+'/'
	files = os.listdir(folder)
	
	jpg_images = normalize(folder, files)

	print "##### ALL #####"
	print files
	print "##### JPGs #####"
	print jpg_images

	results = image_to_string(folder, jpg_images)
	for result in results:
		with io.open('results.txt', 'a', encoding='utf-8') as f:
			f.write(unicode('\n\n###########################################\n'))
			f.write(result)
