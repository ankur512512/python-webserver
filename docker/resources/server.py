from flask import Flask, json

response = {"myFavouriteTree":"tulsi"}

api = Flask(__name__)

@api.route('/tree', methods=['GET'])
def get_companies():
  return json.dumps(response)

if __name__ == '__main__':
    api.run(host='0.0.0.0')
    