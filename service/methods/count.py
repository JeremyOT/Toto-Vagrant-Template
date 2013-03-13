from toto.invocation import *

@authenticated
def invoke(handler, params):
  handler.session['count'] = (handler.session['count'] or 0) + 1
  handler.session.save()
  return {'count': handler.session['count']}
