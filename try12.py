import hashlib
from PIL import Image
import tkinter as tk
from tkinter import filedialog

def hash_image(image_path):
    image = Image.open(image_path)
    image_bytes = image.tobytes()
    hash_object = hashlib.sha256(image_bytes)
    return hash_object.hexdigest()

def compare_hashes(hash1, hash2):
    return hash1 == hash2

root = tk.Tk()
root.withdraw()

image1_path = filedialog.askopenfilename()
image2_path = filedialog.askopenfilename()

hash1 = hash_image(image1_path)
hash2 = hash_image(image2_path)

print("Image 1 hash:", hash1)
print("Image 2 hash:", hash2)

if compare_hashes(hash1, hash2):
    print("The images are identical.")
else:
    print("The images are different.")