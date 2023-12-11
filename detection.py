import cv2
import numpy as np

def detect_steganography(image_path):
    image = cv2.imread(image_path)
    image_hist = cv2.calcHist([image], [0], None, [256], [0, 256])
    if len(np.where(image_hist == 0)[0]) > 10:
        print("Steganography detected in image.")
    else:
        print("No Steganography detected in image.")

detect_steganography('encoded.png')