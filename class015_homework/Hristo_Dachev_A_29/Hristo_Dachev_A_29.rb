require_relative 'csv_writer.rb';require_relative 'xml_writer.rb';require_relative 'json_writer.rb';require_relative 'html_writer.rb';require_relative 'svg_writer.rb'
a=ARGV[0];s=Time.now;@r=Hash.new{|h,k|h[k]={'VH'=>0,'002'=>0,'003'=>0,'004'=>0,'009'=>0,'012'=>0,'014'=>0,'g2'=>0,'g3'=>0,'g4'=>0,'g9'=>'-','g12'=>0,'g14'=>0,'y2'=>'','y3'=>'','y4'=>'','y9'=>'-','y12'=>'','y14'=>''}};f=["#{a}/*_homework","#{a}/vhodno_nivo","#{a}/class004"]
def Y p,d;return `git log --until=#{d} #{p}`.empty? ? 1:2;end
def E f;p=f.split('/').last;m=p.split('_').first;l=p.split('_',2).last.split('_').first;return n="#{m.capitalize} #{l.capitalize}";end
def LL h,f,y,r;@r[E(f)]["#{y}#{h.to_i.to_s}"]=r;end
def O f,h;r=`flog #{f} -c -q -s`.split(":").first;LL(h,f,'g',r);end
def W f,h;r=`flay #{f}`.split("\n").first.scan(/\d+/).first;LL(h,f,'y',r);end
def P t;n=File.read("#{ARGV[0]}/class009_homework/project_to_names.csv");n.split("\n").each do |l|;s=l.split(',');f=s.first;t[f]=[] unless t.key? f;t[f]<<s.last;end;return t;end
def A o,h,d;t=Hash.new;P(t);Dir.glob("#{o}/*.pdf") do |f|;n=f.split('/').last.split('.').first.tr("'",'');if t.key? n;t[n].each do |s|;@r[s][h]=Y(f,d);end;end;end;end
def T f,k,d;k!="VH" ? p="#{f}/**/*_*_*_*.rb" : p="#{f}/**/*_*_*.*";Dir.glob(p) do |f|;@r[E(f)][k]=Y(f,d);if k!="VH";
O(f,k);W(f,k);end;end;end;Dir.glob(f) do |p|;case p.split('/').last;when 'vhodno_nivo';T(p,'VH','17.09.2014:20:00:00');when 'class002_homework';T(p,'002','22.09.2014:20:00:00');when 'class003_homework';T(p,'003','24.09.2014:20:00:00');when 'class004';T(p,'004','29.09.2014:20:00:00');when 'class009_homework';A(p,'009','27.10.2014:20:00:00');when 'class012_homework';T(p,'012','10.11.2014:20:00:00');when 'class014_homework';T(p,'014','13.11.2014:06:00:00');end;end
if  ARGV[1]=='-o';case ARGV[2];when 'csv';w=CSVWriter.new;when 'xml';w=XMLWriter.new;when 'json';w=JSONWriter.new;when 'html';w=HTMLWriter.new;when 'svg';w=SVGWriter.new;else;abort 'Err';end;w.write @r,Time.now-s;end