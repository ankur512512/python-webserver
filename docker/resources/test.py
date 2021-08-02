import requests
from requests.exceptions import ConnectTimeout

def testServerResponse():
    try:
        response = requests.get("http://localhost:5000/tree")
    except Exception as e:
        print("General exception !! Please check the server configuration",e )   

    if(response.status_code == 200):
        print("Test 1: PASSED -- Status Code Test. Received required status code "+str(response.status_code))
    else:
        print("Test 1: FAILED -- Status Code Test. Received status code: "+str(response.status_code)+ " instead of 200")
    if(response.json() == {"myFavouriteTree":"tulsi"}):
        print("Test 2: PASSED -- Content Verfication Test. Received required response: "+str(response.json()))
    else:
        print("Test 2: FAILED -- Content Verification Test. Required content: {'myFavouriteTree': 'tulsi'} but Received response is: "+str(response.json()))        

testServerResponse()