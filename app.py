from flask import Flask,  request,  jsonify
import pickle
import numpy as np
import nltk
import re
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
model1 = pickle.load(open('classifier_depression.pkl', 'rb'))
count = pickle.load(open('count.pkl', 'rb'))
app = Flask(__name__)

@app.route('/predict',methods=['POST'])    
def predictor():
    text = request.form['text']
    lemmatize=nltk.WordNetLemmatizer()
    text=re.sub('[^a-zA-Z]',' ',text)
    text=text.lower()
    text=text.split()
    text=[lemmatize.lemmatize(word) for word in text if not word in stopwords.words('english')]
    text=' '.join(text)
    sample=count.transform([text]).toarray()
    prediction=model1.predict(sample)[0]
    prediction=str(prediction)
    if prediction=='0':
        res='Not Depressed'
    else:
        res='Depressed'
    return jsonify({'isDepressed':res})
  
                     
if __name__ == '__main__':
    app.run(debug=True)
