def analyse(txt):
	frq = 26*[0]
	tot = 0.0
	fq1 = [0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094]
	fq2 = [0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929]
	fq3 = [0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150]
	lfq = fq1 + fq2 + fq3 + [0.01974, 0.00074]
	for cht in txt:
		if ord(cht)>96 and ord(cht)<123:
			frq[ord(cht)-97] += 1
		elif ord(cht)>64 and ord(cht)<91:
			frq[ord(cht)-65] += 1

	for ctr in range(26):
		tot += frq[ctr]

	for ctr in range(26):
		frq[ctr] = (frq[ctr]/tot - lfq[ctr])*100

	sgm = 0; pct = frq
	for ctr in range(26):
		sgm += pct[ctr]**2

	return sgm