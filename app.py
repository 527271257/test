from flask import Flask
from redis import Redis




app=Flask(_name_)

redis=Redis(host='redis',port=6379)


@app.route('/')
defhello():
redis.incr('hits')
    return'Hello World ! this is %s times.' %redis.get('hits')

if _name_=="_main_":
   app.run(host="0.0.0.0",debug=True)

