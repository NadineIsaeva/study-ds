#!/usr/bin/env python
# coding: utf-8

# In[2]:

# Source: https://realpython.com/python-itertools/
# Data: Event,Name,Stroke,Time1,Time2,Time3
# Goal: Find 2 groups (A, B) of 4 with best (min) swimmers' time for each stroke (swimming style)

from collections import namedtuple
import csv
import datetime
import itertools as it
import statistics


class Event(namedtuple('Event', ['stroke', 'name', 'time'])):
    __slots__ = ()

    def __lt__(self, other):
        return self.time < other.time


def sort_and_group(iterable, key=None):
    return it.groupby(sorted(iterable, key=key), key=key)

# fast and memory efficient way to group iterables
def grouper(iterable, n, fillvalue=None):
    iters = [iter(iterable)] * n
    return it.zip_longest(*iters, fillvalue=fillvalue)


def read_events(csvfile, _strptime=datetime.datetime.strptime):
    
    def _median(times):
        return statistics.median((_strptime(time, '%M:%S:%f').time() for time in row['Times']))

    fieldnames = ['Event', 'Name', 'Stroke']
    with open(csvfile) as infile:
        # read each row in CSV file, read 3 time columns in 'Times' list
        reader = csv.DictReader(infile, fieldnames=fieldnames, restkey='Times')
        # get and skip header
        next(reader)
        for row in reader:
            yield Event(row['Stroke'], row['Name'], _median(row['Times']))


events = tuple(read_events('data/swimmers.csv'))

# group all by stroke
for stroke, evts in sort_and_group(events, key=lambda evt: evt.stroke):
    # group by swimmer name
    events_by_name = sort_and_group(evts, key=lambda evt: evt.name)
    # best time for each swimmer
    best_times = (min(evt) for _, evt in events_by_name)
    sorted_by_time = sorted(best_times, key=lambda evt: evt.time)
    # take first 2 groups by 4
    teams = zip(('A', 'B'), it.islice(grouper(sorted_by_time, 4), 2))
    for team, swimmers in teams:
        print('{} {}: {}'.format(
            stroke.capitalize(),
            team,
            ', '.join(swimmer.name for swimmer in swimmers)
        ))

        
"""
Backstroke A: Sophia, Grace, Penelope, Addison
Backstroke B: Elizabeth, Audrey, Emily, Aria
Breaststroke A: Samantha, Avery, Layla, Zoe
Breaststroke B: Lillian, Aria, Ava, Alexa
Butterfly A: Audrey, Leah, Layla, Samantha
Butterfly B: Alexa, Zoey, Emma, Madison
Freestyle A: Aubrey, Emma, Olivia, Evelyn
Freestyle B: Elizabeth, Zoe, Addison, Madison
"""
