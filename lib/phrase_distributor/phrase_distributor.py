# encoding: *- utf-8 -*
# author: Matt Kerrigan
# contact: matt@networkinguys.com
# github: mkerrig


import json
from threading import *
import time

class Phrase(object):
    '''
    Object used to represent Jonty's phrases/words, to be then later
    initialized and managed in the PhraseThread object

    Pretty self explanatory for the attributes so I'm not going to explain
    them in depth
    '''
    def __init__(self,phrase_en,phrase_foreign,foreign_language,
    audio_file,audio_duration,timer,times_seen):
        self.phrase_en=phrase_en
        self.phrase_foreign=phrase_foreign
        self.foreign_language=foreign_language
        self.audio_file=audio_file
        self.audio_duration=audio_duration
        self.timer=timer # timer that's being constantly edited by PhraseThread
        self.times_seen=times_seen # times the user has observed word/Phrase

    # pyhton methods to represent in stdout
    def __str__(self):
        return u"Phase in English: {}".format(self.phrase_en)\
        +u"Phrase in {}: {}".format(self.foreign_language,self.phrase_foreign)\
        +u"Audio Filename: {}".format(self.audio_file)\
        +u"Audio Duration: {}".format(self.audio_duration)\
        +u"Timer: {}".format(self.timer)\
        +u"Times seen: {}".format(self.times_seen)

    def __repr__(self):
        return u"Phase in English: {}".format(self.phrase_en)\
        +u"Phrase in {}: {}".format(self.foreign_language,self.phrase_foreign)\
        +u"Audio Filename: {}".format(self.audio_file)\
        +u"Audio Duration: {}".format(self.audio_duration)\
        +u"Timer: {}".format(self.timer)\
        +u"Times seen: {}".format(self.times_seen)
    # convert object to json
    def to_json(self):
        json.dumps({
        'phrase_en':phrase_en,
        'phrase_foreign':phrase_foreign,
        'foreign_language':foreign_language,
        'audio_file':audio_file,
        'audio_duration':audio_duration,
        'timer':timer,
        'times_seen':times_seen
        })


class PhraseThread(Thread):
    '''
    Manages all the Thread information, still need to implement some logic to
    handle which order to display
    '''

    def __init__(self, phrase):
        self.phrase=phrase # takes Phrase object
        self.running = False
        super(PhraseThread, self).__init__() # use parent Thread class initializer
    # starts the thread
    def start(self):
        self.running = True
        super(PhraseThread, self).start() # use parent start method
    # how thread operates on the fly, can pause execution using while loops
    def run(self):
        while self.running:
            self.phrase.timer-=1
            time.sleep(1) # wait a second to subtract from the timer
            print 'Timer Change {}'.format(self.phrase.phrase_foreign)

            while self.phrase.timer == 0:
                self.phrase.times_seen+=1
                time.sleep(5)
                self.phrase.timer = 5


def bullshit_simulation():
    #demonstrate functionality of structures, held off on implementing logic
    #because I figured it's probably going to change once we have a real
    #frontend
    i = 0
    threads = []
    while i < 5:
        phrase_en='Hello'
        phrase_foreign='Hola {}'.format(i)
        foreign_language='Spanish'
        audio_file='hola.mp3'
        audio_duration=1
        timer=5
        times_seen=0
        phrase = Phrase(phrase_en,phrase_foreign,foreign_language,
        audio_file,audio_duration,timer,times_seen)
        threads.append(PhraseThread(phrase))
        threads[i].start()
        i+=1
bullshit_simulation() # for your own processors sake, hit ctrl-c after a bit if you run this
