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
from efficientnet_royals import predictImage

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
                
                "status": "Image Opened"
            }
        )
    except:
        return jsonify(
            {
                "status": "Image Error"
            }
        )



#andh predict 


if __name__ == '__main__':
    app.run(host='172.20.10.3', port=8003)