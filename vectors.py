import os
from random import random
from time import time


def vectable(runs):
	""" """
	test = []

	for i in range(0, 1024):
		x, y, z, w = random(), random(), random(), random()
		test.append((x, y, z, w))

	start = time()
	total = 0

	for i in range(0, runs):
		for j in range(0, len(test), 2):
			#print i, j
			a, b = test[j], test[j+1]
			dot = (a[0] * b[0]) + (a[1] * b[1]) + (a[2] * b[2]) + (a[3] * b[3])
			total = total + dot

	finish = time()

	print('table %.2fs total: %f' % ((finish-start), total))



runs = 20000

for i in range(0, 5):
	vectable(runs)