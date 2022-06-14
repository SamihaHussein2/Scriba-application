<<<<<<< Updated upstream
# # -*- coding: utf-8 -*-
# """
# Created on Fri Mar  4 13:04:35 2022

# @author: Ragaa
# """

import pandas as pd
import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.layers import Dense, Activation
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.metrics import categorical_crossentropy
from tensorflow.keras.models import load_model
#from keras_preprocessing.image import ImageDataGenerator
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.preprocessing import image
from tensorflow.keras.models import Model
from tensorflow.keras.applications import imagenet_utils
from IPython.display import Image
import os
from silence_tensorflow import silence_tensorflow
silence_tensorflow()
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"

file_path = "030029_M17.png"


def prepare_image(file):
    img = image.load_img(file, target_size=(224,224))
    img_array = image.img_to_array(img)
    img_array_expanded_dims = np.expand_dims(img_array,axis=0)
    return tf.keras.applications.mobilenet.preprocess_input(img_array_expanded_dims)


preprocessed_image = prepare_image(file_path)
model = load_model("./my_model.h5")
predictions = model.predict(preprocessed_image)
preds = np.argsort(predictions)[:, -1:][0]
print(preds[0])



















# from flask import Flask
# from flask import jsonify
# from flask import request
# from PIL import Image
# from io import BytesIO
# import base64
# # from python_backend.efficientnet_royals import predictImage
# from efficientnet_royals import predictImage

# app = Flask(__name__)

# # @app.route('/hello', methods=['GET'])
# # def helloWorldFunction():
# #     return "Hello World!"

# @app.route('/classification', methods = ['GET'])
# def returnClassification():
#     return " "



# @app.route('/image', methods=['POST'])
# def sendImagePostRequestFunction():
#     print("here")
#     data = request.json['image']
#     try:
#         print("hereee")
#         image = Image.open(BytesIO(base64.b64decode(data)))
#         prediction=predictImage(image)
#         print(image)
#         return jsonify(
#             {
=======
# -*- coding: utf-8 -*-
"""
Created on Fri Mar  4 13:04:35 2022

@author: Ragaa
"""

from flask import Flask
from flask import jsonify
from flask import request
from PIL import Image
from io import BytesIO
import base64
# from python_backend.efficientnet_royals import predictImage
# from efficientnet_royals import predictImage

app = Flask(__name__)

# @app.route('/hello', methods=['GET'])
# def helloWorldFunction():
#     return "Hello World!"

@app.route('/classification', methods = ['GET'])
def returnClassification():
    return " "



@app.route('/image', methods=['POST'])
def sendImagePostRequestFunction():
    print("here")
    data = request.json['image']
    try:
        print("hereee")
        image = Image.open(BytesIO(base64.b64decode(data)))
        prediction=predictImage(image)
        print(image)
        return jsonify(
            {
>>>>>>> Stashed changes
                
#                 "status": "Image Opened"
#             }
#         )
#     except:
#         return jsonify(
#             {
#                 "status": "Image Error"
#             }
#         )


<<<<<<< Updated upstream

# #andh predict 


# if __name__ == '__main__':
#     app.run(host='172.20.10.3', port=8003)
=======
if __name__ == '__main__':
    app.run(host='172.20.10.3', port=8003)
>>>>>>> Stashed changes
