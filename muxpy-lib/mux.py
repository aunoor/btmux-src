import muxc
import sys, traceback

def load():
    muxc.notify (1, "load")
    pass

def save():
    muxc.notify (1, "save")
    pass

def update():
    try:
        #print muxc.muxeval (1, "eval(#104,CONSOLE.DESC)")
        #muxc.notify (1, "update")
        pass
    except Exception, e:
         print 'Failed call muxeval: '+ str(e)
    pass
