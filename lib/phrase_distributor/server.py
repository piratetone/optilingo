from flask import Flask
app = Flask(__name__)
from phrase_distributor import Phrase,PhraseThread

@app.route('/postmates', methods=['GET','POST'])
def postmates():
    if request.method == 'POST':
        print 'HEADERS ', request.headers
        print request.data
        json_req = json.loads(request.data)
        json_res = {'message':'Fuck you Gary'}
        return json.dumps(json_res)
    if request.method == 'GET':
        return 'Fuck you Gary, just make it a POST request...'

if __name__ == "__main__":
    app.run(port=4000)
