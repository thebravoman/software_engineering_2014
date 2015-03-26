try:
	from urllib2 import (Request, urlopen) #Python2
except ImportError:
	from urllib.request import (Request, urlopen) #Python3

PROJECTS_CSV = 'https://raw.githubusercontent.com/thebravoman/software_engineering_2014/master/second_term/projects.csv'
USER_AGENT = 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0'

lang_dict = {}

for project in urlopen(PROJECTS_CSV).readlines()[1:]:
	if 'github.com' in project:
		request = Request(project.split(',')[-1], headers={'User-Agent': USER_AGENT})
		project_source = urlopen(request).read()
		
		for i in range(1, project_source.count('percent')+1):
			lang_name = project_source.split('class="lang">')[i].split('</span>')[0]
			percents = project_source.split('class="percent">')[i].split('</span>')[0]
			try:
				lang_dict[lang_name] += float(percents[:-1])
			except KeyError:
				lang_dict[lang_name] = 0
				lang_dict[lang_name] += float(percents[:-1])

with open('project_stats.csv', 'w+') as file:
	file.write('Language,% used in projects\n')
	for k,v in sorted(lang_dict.items(), key=lambda x: x[1], reverse=True):
		file.write('{k},{v}%\n'.format(**vars()))
	file.write('You can get the source at:,../scripts/project_stats.py,\n')
