try:
    import ujson as json
except ImportError:
    import json

print(json.dumps(False))
print(json.dumps(True))
print(json.dumps(None))
print(json.dumps(1))
print(json.dumps(1.2))
print(json.dumps('abc'))
print(json.dumps('\x00\x01\x7e'))
print(json.dumps([]))
print(json.dumps([1]))
print(json.dumps([1, 2]))
print(json.dumps([1, True]))
print(json.dumps(()))
print(json.dumps((1,)))
print(json.dumps((1, 2)))
print(json.dumps((1, (2, 3))))
print(json.dumps({}))
print(json.dumps({"a":1}))
print(json.dumps({"a":(2,[3,None])}))
