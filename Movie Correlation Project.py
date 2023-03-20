#!/usr/bin/env python
# coding: utf-8

# ## Import Python Libraries

# In[3]:


pip install ipython


# In[4]:


pip install nbconvert


# In[6]:


ipython nbconvert — to script movieportfolio.ipynb


# In[53]:


#Import libraries

#pandas digunakan untuk memanipulasi dan analisis data
#seaborn digunakan visualisasi data
#matplotlib digunakan untuk menyetel atau mengatur visualisasi data

import pandas as pd
import seaborn as sns 
import numpy as np
from datetime import datetime
import re

import matplotlib
import matplotlib.pyplot as plt
plt.style.use('ggplot')
from matplotlib.pyplot import figure 

get_ipython().run_line_magic('matplotlib', 'inline')
matplotlib.rcParams['figure.figsize'] = (12,8) 


#Membaca data 
df = pd.read_csv(r'D:\Data Analis\youtube\movies.csv')


# ## Membaca dan Menampilkan Data

# In[3]:


# Menampilkan data 

df.head()


# ## Membuat Suatu Analisis atau Hipotesis Data
# 
# Ketika produksi film membuat budget film yang tinggi, maka ekspektasi dari pendapatan yang akan dihasilkan juga akan semakin tinggi. 
# 
# Selanjutnya kita akan melihat parameter mana yang sangat berkolerasi dengan peningkatan pendapatan(gross). 

# In[4]:


#Mengecek ulang data 

for col in df.columns:
    pct_missing = np.mean(df[col].isnull())
    print('() - ()%'.format(col, pct_missing))


# In[5]:


# Melihat tipe data untuk setiap kolom

df.dtypes


# In[6]:


try:
    df['budget'] = df['budget'].astype('int64')
except (ValueError, OverflowError):
    # handle the error here
    print("Error: could not convert 'budget' column to int64 data type")


# ## Cleaning Data

# In[28]:


#mengganti tipe data dari kolom budget dan gross
#

df['budget']= df['budget'].fillna('int64')

df['gross']= df['gross'].fillna('int64')

df


# In[29]:


#Menampilkan seluruh data

pd.set_option('display.max_rows', None)


# In[ ]:


#mengurutkan gross ke nilai tertinggi ke rendah

df = df.sort_values(['gross'], inplace = False, ascending=False)

df


# In[9]:


# Drop any duplicates
# menunjukkan ke kita nilai apa yang berbeda

df['company'].drop_duplicates().sort_values(ascending=False)


# ## Mencari Korelasi Data dengan Visualisasi Data

# In[ ]:


# Budget akan memiliki korelasi yang tinggi dengan peningkatan pendapatan
# company juga memiliki korelasi yang tinggi 
# sekarang kita akan membandingkan mereka


# In[12]:


# Scatter plot budget dengan gross
# Ubah budget dan gross menjadi str

plt.scatter( x = df['budget'], y = df['gross'])

plt.title('Budget VS Gross Earnings')

plt.xlabel('Gross Earnings')

plt.ylabel('Budget for Film')

plt.show()


# In[13]:


df.head()


# Terlihat dari grafik kita masih kesulitan untuk menetapkan apakah memang budget menentukan peningkatan gross. Maka dari itu diperlukan fungsi regresi untuk melihat persamaan linear grafik dan menentukan apakah hipotesis kita benar atau salah. 

# In[20]:


# plot the budget vs gross using seaborn 
# ubah dulu datarnya ke numeric function sebelum di plot pake seaborn.
# Karena akan mengubah semua nilai yang ada NaN itu terhapus 
# menggunakan fungsi 'dropna()'

df['budget'] = pd.to_numeric(df['budget'], errors = 'coerce')
df['gross'] = pd.to_numeric(df['gross'], errors = 'coerce')
df = df.dropna()

sns.regplot(x = 'budget', y = 'gross', data = df, scatter_kws = {'color' : 'red'}, line_kws = {'color' : 'blue'})


# Berdasarkan data di atas, ketika ditarik garis persamaan linear maka dapat terlihat bahwa budget memang menjadi faktor meningkatnya pendapatan kotor(gross). 
# 
# Namun, besarnya seberapa kita masih belum tahu. 

# ### Analisis Korelasi

# In[26]:




#df.corr merupakan fungsi yang digunakan untuk menunjukkan korelasi
#atau seberapa erat hubungan linear antar dua variabel yang ditunjukkan melalui pasangan kolom
#rentang nilai keofisien korelasi antara -1 sampai 1
#nilai -1 artinya korelasi negatif atau hubungan berbanding terbalik
#nilai 1 artinya korelasi positif atau hubungan berbanding lurus. 

df.corr(method = 'pearson')


# Terlihat bahwa gross dan budget memiliki korelasi bernilai 0.7 yang artinya lebih tinggi daripada yang lain. 
# 
# Hipotesis benar.

# In[30]:


correlation_matrix = df.corr(method = 'pearson')

sns.heatmap(correlation_matrix, annot = True)

plt.title('Correlation Matrix for Numeric Features')

plt.xlabel('Movie Features')

plt.ylabel('Movie Features')

plt.show()


# Berdasarkan representasi grafik di atas, warna tiap cell mengindikasikan seberapa kuat korelasi antar dua variabel yang dibandingkan. Semakin gelap warna, maka memiliki korelasi yang semakin kuat. 

# #### Analisis korelasi dengan Company

# In[31]:


df.head()


# Terlihat bahwa kolom 'Company' memiliki tipe data string. Jika dibuat data, akan lebi mudah membuat kolom ini menjadi numerik agar bisa dikalkulasi dan dicari hubungannya. 
# 
# Company ternyata memiliki beberapa nama yang berbeda meskipun dalam satu perusahaan yang sama. 

# In[17]:


#Mengubah 'company' menjadi numerik

df_numerized = df.copy()

for col_name in df.select_dtypes(include = ['object']).columns: 
    df_numerized[col_name] = df_numerized[col_name].astype('category')
    df_numerized[col_name] = df_numerized[col_name].cat.codes
        
df_numerized    

# tipe data 0bject bisa diubah ke numeric pada pandas menggunakan 'cat.codes'
# pertama mengubah nama variabel df menjadi df.numerized. Artinya, apapun yang berubah pada df.numerized akan mengubah data df juga. 
# beberapa akan bermasalah jika menggunakan df original.
# untuk mengatasinya bisa menggunakan copy an dari data df.
# untuk menghindari typo dapat diganti dengan df.select.dytypes(include = ['object'])


# ### Mencari korelasi dari dua variabel terkait

# In[47]:


correlation_mat = df_numerized.corr()

corr_pairs = correlation_mat.unstack()

corr_pairs


# In[48]:


sorted_pairs = corr_pairs.sort_values()

sorted_pairs


# In[51]:


high_corr = sorted_pairs[(sorted_pairs) > 0.5]

high_corr


# Ternyata variabel 'votes' memiliki nilai korelasi paling tinggi dengan 'gross' dari pada 'budget, sebesar 0.7
# 
# variabel 'company' juga memiliki nilai korelasi rendah, tidak sampai 0.5
# 
# Hipotesis = salah 
# 
