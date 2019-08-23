# -*- coding: utf-8 -*-

# https://www.kaggle.com/rajmehra03/a-detailed-explanation-of-keras-embedding-layer

# Ignore warnings
import warnings
warnings.filterwarnings('always')
warnings.filterwarnings('ignore')

# nltk
import nltk
nltk.download('stopwords')
nltk.download('punkt')
from nltk.corpus import stopwords
stop_words=set(nltk.corpus.stopwords.words('english'))
from nltk import word_tokenize, sent_tokenize

# Keras
import keras
from keras.preprocessing.text import one_hot, Tokenizer
from keras.preprocessing.sequence import pad_sequences
from keras.models import Sequential
from keras.layers import Dense, Flatten, Embedding, Input
from keras.models import Model

sample_text_1 = "bitty bought a bit of butter"
sample_text_2 = "but the bit of butter was a bit bitter"
sample_text_3 = "so she bought some better butter to make the bitter butter better"

corpus = [sample_text_1, sample_text_2, sample_text_3]
no_docs = len(corpus)

# Represent each word in document by integer
vocab_size = 50 
encod_corpus = []
for i, doc in enumerate(corpus):
    encod_corpus.append(one_hot(doc, vocab_size))
    print("The encoding for document", i+1, "is:", one_hot(doc, 50))

"""**Keras Embedding layer requires all individual documents to be of same length**"""

# Pad the shorter documents
# input_length = length of doc with maximum length

# Find max length
max_len = -1
for doc in corpus:
  tokens = nltk.word_tokenize(doc)
  if len(tokens) > max_len:
    max_len = len(tokens)
    
print("Maximum length of doc in corpus: {}".format(max_len))

# Pad docs shorter than 12 words
pad_corpus = pad_sequences(encod_corpus, # list of lists
                           maxlen=max_len,
                           padding='post', # pad after each sequence
                           value = 0.0
                          )
      
for i, doc in enumerate(pad_corpus):
      print('Padded encoding for {} doc: {}'.format(i + 1, doc))
    
print('Number of padded docs: {}'.format(len(pad_corpus)))

"""**Embed the words into vectors of 8 dimensions**"""

# Input shape
input = Input(shape=(no_docs, max_len), dtype='float64') # (3, 12)
print(type(input))
print(input.shape)

word_input = Input(shape=(max_len,), dtype='float64')

# Create embedding
word_embedding = Embedding(input_dim=vocab_size, # number of distinct words in training set == Size of vocabulary (chosen)
                           output_dim=8, # size of embedding vectors (represent each word by vector of such dimension)
                           input_length=max_len # size of each input sequence (size of maximum len doc in train)
                          )
print('Initialize embedding layer:', type(word_embedding))
word_embedding = word_embedding(word_input)
print(type(word_embedding))
print(word_embedding.shape)

word_vec = Flatten()
print(type(word_vec), '\n')
word_vec = word_vec(word_embedding)
print(type(word_vec))
print(word_vec)

embed_model = Model([word_input], word_vec)
for layer in embed_model.layers:
  print(layer.output_shape)
print(embed_model.summary())

embed_model.compile(optimizer=keras.optimizers.Adam(lr=1e-3), loss='binary_crossentropy', metrics=['acc'])

# Get embeddings

embeddings = embed_model.predict(pad_corpus)
print("Shape of embeddings: {}".format(embeddings.shape))
print(embeddings[0])

embeddings = embeddings.reshape(-1, max_len, 8)
print("Shape of embeddings: {}".format(embeddings.shape)) 
#print(embeddings[0]) # 1st document
print(embeddings[0][0]) # 1st word in 1st document
