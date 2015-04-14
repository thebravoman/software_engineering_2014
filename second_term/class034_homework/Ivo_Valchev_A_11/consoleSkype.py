import Skype4Py
import sys
from Crypto.PublicKey import RSA
from Crypto import Random
import base64


connection_established = False

def OnMessageStatus(Message, Status):
    global connection_established
    global foreign_public_key
    global my_key
    if Status == 'RECEIVED':
        if(connection_established):
            decrypted_message = my_key.decrypt(base64.b64decode(Message.Body))
            print(Message.FromDisplayName + ': ' + decrypted_message)
        else:
            msg = Message.Body
            foreign_public_key = RSA.importKey(msg)
            connection_established = True


def generate_key():
    random_generator = Random.new().read
    key = RSA.generate(1024, random_generator)
    return key

username = ""
my_key = generate_key()
foreign_public_key = None

skype = Skype4Py.Skype()
skype.Attach()
skype.OnMessageStatus = OnMessageStatus

print 'Your Skype name:', skype.CurrentUser.FullName

while True:
    line = sys.stdin.readline()
    line.split("\n")[0]
    if(line.split(" ", 1) != -1):
        if(line.split(" ", 1)[0].startswith('user:')):
            username = line.split(" ", 1)[0].split(':')[1]
            message = my_key.publickey().exportKey()
        else:
            message = base64.b64encode(foreign_public_key.encrypt(line, 1024)[0])
    skype.SendMessage(username, message)