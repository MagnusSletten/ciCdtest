data = [1,2,3,5,6,7,8]

def reformatData():
    lastVal = data.pop()
    data.clear
    data.append(lastVal+1)
    return data 
    