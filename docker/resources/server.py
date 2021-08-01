from flask import Flask, json

companies = {"myFavouriteTree":"Palm"}

api = Flask(__name__)

@api.route('/tree', methods=['GET'])
def get_companies():
  return json.dumps(companies)

if __name__ == '__main__':
    api.run(host='0.0.0.0') 