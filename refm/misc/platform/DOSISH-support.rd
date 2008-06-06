###nonref

= DOSISH �б�

ruby version 1.7 �Ǥϡ�DOSISH�б�(DOS/Windows �Υѥ�̾�ΰ������Ф�����
��)���ޤޤ�Ƥ��ޤ�((-��ĥ�饤�֥��ˤ���̼����Ȥ��ơ�
((<RAA|URL:http://www.ruby-lang.org/en/raa.html>))��
((<RAA:DOSish>))������ޤ� -))��
(���ߤ�)�ѹ�����ʲ��˼����ޤ���

�ʤ����������ѹ��� ((<mswin32>))�ǡ�((<mingw32>))��, ((<bccwin32>))��, 
((<human68k>))��, ((<os2_emx>))�Ǥ� Ruby �ˤΤߤ��ƤϤޤ�ޤ���

�Ȥꤢ��������ɸ�Ȥ��ơ�

* \ �� / ��Ʊ�ͥѥ����ѥ졼���Ȥ��ư���
* �ޥ���Х��ȥѥ�̾�ؤ��б�("ɽ" �ʤ� 2 byte �ܤ� 0x5c(`\') �Ǥ���ʸ��������������)
* UNC �б�(���켫�Τ�1.6�ˤ����äƤ���)
* �ɥ饤�֥쥿���б�

�ؤ��б����󤲤��Ƥ��ޤ������ɥ饤�֥쥿���б��ʤɤ���̯����ʬ�ˤĤ��Ƥϸ��ߤ�ruby-list�ʤɤǵ�������³����Ƥ��ޤ���
�������Ǥϡ�File�γƥ᥽�åɤ��Ф���\�б�, �ޥ���Х��ȥѥ�̾�б�, UNC �б�����������Ƥ��ޤ���((<ruby-dev:13817>)), ((<ruby-dev:14097>))

�ʲ����ƥ᥽�åɤε�ư�ˤĤ���...

: File.dirname

  �ѥ����ѥ졼���Ȥ��ƽ����/�˲ä���\��ǧ������褦�ˤʤäƤ��ޤ���
  ����˹�碌�ơ��ޥ���Х��Ȥǵ��Ҥ��줿�ѥ�̾�ؤ��б���Ԥ��Ƥ��ޤ���

    p File.dirname("C:\\foo\\bar")

    => ruby 1.6.4 (2001-06-04) [i586-mswin32]
       "."

    => ruby 1.7.1 (2001-08-16) [i586-mswin32]
       "C:\\foo"

    p File.dirname("C:/foo")
    p File.dirname("C:\\foo")
    p File.dirname("C:foo")

    => ruby 1.6.4 (2001-06-04) [i586-mswin32]
       "C:"
       "."
       "."

    => ruby 1.7.1 (2001-08-16) [i586-mswin32]
       "C:"
       "C:"
       "."

    => ruby 1.8.0 (2003-01-06) [i386-mswin32]
       "C:/"
       "C:\\"
       "C:."

: File.basename

  �ѥ����ѥ졼���Ȥ��ƽ����/�˲ä���\��ǧ������褦�ˤʤäƤ��ޤ���
  ����˹�碌�ơ��ޥ���Х��Ȥǵ��Ҥ��줿�ѥ�̾�ؤ��б���Ԥ��Ƥ��ޤ���

    p File.basename("C:\\foo\\bar")

    => ruby 1.6.4 (2001-06-04) [i586-mswin32]
       "C:\\foo\\bar"

    => ruby 1.7.1 (2001-08-16) [i586-mswin32]
       "bar"

: File.split

  File.dirname �� File.basename ���ѹ�����Ƥ���Τǡ�File.split �⤽��˽स��
  ��̤��֤��ޤ���

: File.expand_path

  �ɥ饤�֥쥿���б��˴ؤ��ơ������Τ褦�ʰƤ��󼨤���Ƥ��ޤ���

    Dir.chdir("D:/")
    p File.expand_path("C:foo", "C:/bar")
    p File.expand_path("D:foo", "C:/bar")

    => ruby 1.6.4 (2001-06-04) [i586-mswin32]
       "C:/bar/C:foo"
       "C:/bar/D:foo"

    => ruby 1.8.0 (2003-01-06) [i386-mswin32]
       "C:/bar/foo"
       "D:/foo"

    => ����� ((<ruby-list:30970>))
       "C:/bar/foo"
       (�ʤ�餫���㳰)

: File.join

  �ɥ饤�֥쥿���б��˴ؤ��ơ������Τ褦�ʰƤ��󼨤���Ƥ��ޤ���

    p File.join("c:", "foo")
    p File.join("c:/", "foo")
    p File.join("c:.", "foo")
    p File.join("c:", "/foo")

    => ruby 1.6.4 (2001-06-04) [i586-mswin32]
       "c:/foo"
       "c://foo"
       "c:./foo"
       "c://foo"

    => ruby 1.8.0 (2003-01-06) [i386-mswin32]
       "c:/foo"
       "c:/foo"
       "c:./foo"
       "c://foo"

    => ����� ((<ruby-list:31185>))
       "c:./foo"
       "c:/foo"
       "c:./foo"
       "c:./foo"

: File.fnmatch
: Dir.glob
: Dir[]