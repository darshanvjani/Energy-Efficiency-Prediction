import pickle
import sklearn
import pandas
import numpy as np
ujas = pickle.load(open("scaler.pkl","rb"))
dhruvin = pickle.load(open("rf_model.pkl","rb"))

input_from_api = [0.25,1,7,0.69,0.045,27,8,1]

data = input_from_api.pop()

scaled_input_from_api = ujas.transform(np.array(input_from_api).reshape(1,-1))

def dump_function(data):
    if data == 0:
        return [1,0,0,0,0]
    if data == 1:
        return [0,1,0,0,0]
    if data == 2:
        return [0,0,1,0,0]
    if data == 3:
        return [0,0,0,1,0]
    if data == 4:
        return [0,0,0,0,1]
    if data == 5:
        return [0,0,0,0,0]

dummy = np.array(dump_function(data))

final_array = np.concatenate((scaled_input_from_api[0],dummy))

pred = dhruvin.predict(final_array.reshape(1,-1)) 

print("Heating Load:",pred[0][0])
print("Cooling Load:",pred[0][1])


