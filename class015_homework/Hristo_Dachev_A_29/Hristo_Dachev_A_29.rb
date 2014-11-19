require_relative 'csv_writer.rb';require_relative 'xml_writer.rb';require_relative 'json_writer.rb';require_relative 'html_writer.rb';require_relative 'svg_writer.rb'
a=ARGV[0];s=Time.now;@r=Hash.new{|h,k|h[k]={'VH'=>0,'002'=>0,'003'=>0,'004'=>0,'009'=>0,'012'=>0,'014'=>0,'g2'=>0,'g3'=>0,'g4'=>0,'g9'=>'-','g12'=>0,'g14'=>0,'y2'=>'','y3'=>'','y4'=>'','y9'=>'-','y12'=>'','y14'=>''}};f=["#{a}/*_homework","#{a}/vhodno_nivo","#{a}/class004"]
def T p,d;return `git log --until=#{d} #{p}`.empty? ? 1:2;end
def i f;p=f.split('/').last;m=p.split('_').first;l=p.split('_',2).last.split('_').first;return n="#{m.capitalize} #{l.capitalize}";end
def N h,f,y,r;@r[i(f)]["#{y}#{h.to_i.to_s}"]=r;end
def G f,h;r=`flog #{f} -c -q -s`.split(":").first;N(h,f,'g',r);end
def Y f,h;r=`flay #{f}`.split("\n").first.scan(/\d+/).first;N(h,f,'y',r);end
def S t;n=File.read("#{ARGV[0]}/class009_homework/project_to_names.csv");n.split("\n").each do |l|;s=l.split(',');f=s.first;t[f]=[] unless t.key? f;t[f]<<s.last;end;return t;end
def k o,h,d;t=Hash.new;S(t);Dir.glob("#{o}/*.pdf") do |f|;n=f.split('/').last.split('.').first.tr("'",'');if t.key? n;t[n].each do |s|;@r[s][h]=T(f,d);end;end;end;end
def C f,h,d;h!="VH" ? p="#{f}/**/*_*_*_*.rb" : p="#{f}/**/*_*_*.*";Dir.glob(p) do |f|;@r[i(f)][h]=T(f,d);if h!="VH";G(f,h);Y(f,h);end;end;end
Dir.glob(f) do |p|;case p.split('/').last;when 'vhodno_nivo';C(p,'VH','17.09.2014:20:00:00');when 'class002_homework';C(p,'002','22.09.2014:20:00:00');when 'class003_homework';C(p,'003','24.09.2014:20:00:00');when 'class004';C(p,'004','29.09.2014:20:00:00');when 'class009_homework';k(p,'009','27.10.2014:20:00:00');when 'class012_homework';C(p,'012','10.11.2014:20:00:00');when 'class014_homework';C(p,'014','13.11.2014:06:00:00');end;end
if ARGV[1]=='-o';case ARGV[2];when 'csv';w=CSVWriter.new;when 'xml';w=XMLWriter.new;when 'json';w=JSONWriter.new;when 'html';w=HTMLWriter.new;when 'svg';w=SVGWriter.new;else;abort 'Err';end;w.write @r,Time.now-s;end