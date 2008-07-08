= ����ɽ��

����ɽ���˴ؤ��Ƥ�[[ref:d:spec/literal#regexp]]��[[m:$&]]��
[[c:Regexp]] ������ [[c:MatchData]] �ʤɤ⻲�Ȥ��Ʋ�������

   * [[ref:regexp]]
   * [[ref:backref]]
   * [[ref:string]]
   * [[ref:backtrack]]
   * [[ref:sample]]

===[a:regexp] ����ɽ������

�ʲ��ϡ�ruby �����ݡ��Ȥ�������ɽ������(�᥿ʸ��)�ΰ����Ǥ���
(����ɽ���Υ��ץ����ˤĤ��Ƥ�[[ref:d:spec/literal#regexp]]�򻲾Ȥ��Ƥ�������)

  * \��ȼ��ʤ��ѿ��� �ϥ᥿ʸ���ǤϤʤ�
  * \��ȼ������ �ϥ᥿ʸ���ǤϤʤ�(`\*'�ϡַ����֤��פǤʤ��֥������ꥹ����)

�Ȥ�����§������ޤ���

�ʲ�����������ǡ�¿�Х���ʸ�����б���������ɽ���פȤϡ�
[[m:$KCODE]] �����ꤵ��Ƥ��뤫�����뤤������Ū�˴������ץ���
��([[ref:d:spec/literal#regexp]]�򻲾�)����ꤹ��ʤɤˤ��¿�Х���ʸ��
�˥ޥå�����������ɽ����ؤ��ޤ���

: ^
  ��Ƭ��ʸ�������Ƭ�����ʸ����ľ��ΰ��֤˥ޥå����ޤ���

: $
  ������ʸ��������������ʸ����ľ���ΰ��֤˥ޥå����ޤ������Լ��Ȥϴ�
  �ߤޤ���

  ((<ruby 1.8 feature>)): �����ϡ�ʸ���������β��Ԥ��Ф��Ʋ��Ԥ�������
  �˥ޥå����Ƥ��ޤ����������ʸ����������ˤ�ޥå�����褦���ѹ�����
  �ޤ�����[[trap:Regexp]]
//emlist{
        p "\n".gsub(/$/, "o")
        => "o\n"  (1.6)
        => "o\no" (1.8) # ����ʸ��������ʸ��������������1�󤺤�
//}
: .

  ���Ԥ����Ǥ�դ� 1 ʸ���˥ޥå����ޤ�������ɽ�����ץ���� m (ʣ����
  �⡼�ɡ�[[ref:d:spec/literal#regexp]]�򻲾�)�Ǥϡ����Ԥ�ޤ�Ǥ�դ�
  1 ʸ���˥ޥå����ޤ���

  ¿�Х���ʸ�����б���������ɽ���Ǥϡ����� 1 ʸ��(1 �Х��ȤǤʤ�)�ȥޥ�
  �����ޤ���
//emlist{
        $KCODE = "sjis"          # ���������ɻ��ꡢUnix�ʤ�"euc"
        p /..a./  =~ "������a��" # => 2 (ʸ�����3byte�ܤ���ޥå�)
        p /..a./n =~ "��a��"   # => 0 (���Ū�˴��������ɤ�"none"�˻���)
//}
  �ޤ����Դ�����¿�Х���ʸ���ΰ���(����ʸ�������Ǥ�¿�Х���ʸ�����Х�
  �ʥ꤫ASCII��Ƚ�Ǥ��դ��ʤ����)�Ȥϥޥå����ޤ���
//emlist{
        p /./e =~ "��"[0,1]     # => nil
//}

: \w

  �ѿ�����[0-9A-Za-z_] ��Ʊ����

  ¿�Х���ʸ�����б���������ɽ���Ǥϡ����ܸ�Τ���������ʸ���ˤ�ޥ�
  �����ޤ���[0-9A-Za-z_��-����-�ڣ�-��] �ȤǤ�����ޤ��礦����
#@#  ((- [2004-10-22] ���줸�㡢�Ҥ餬�ʡ��������ʡ������ϴޤޤ�Ƥ��ʤ��äƤ��Ȥˤʤ�ʤ��� �ºݤϴޤ��͡� /[0-9A-Za-z_��-����-�ڣ�-��]/e =~ '��' # => nil, /\w/e =~ '��' # => 0 -))

: \W

  ��ѿ�����\w �ʳ��ΰ�ʸ����

: \s

  ����ʸ����[ \t\n\r\f] ��Ʊ��

: \S

  �����ʸ����[ \t\n\r\f] �ʳ��ΰ�ʸ����

: \d

  ������[0-9] ��Ʊ����������Ϥ���������ʸ���ˤϷ褷�ƥޥå����ޤ���

: \D

  �����

: \A

  ʸ������Ƭ��^ �Ȥϰۤʤ���Ԥ�̵ͭ�ˤϱƶ����ޤ���

: \Z

  ʸ����������ʸ���󤬲��Ԥǽ��äƤ���Ф��β��Ԥ�ľ���˥ޥå����ޤ���

  ((<ruby 1.8 feature>)): �����ϡ�ʸ���������β��Ԥ��Ф��Ʋ��Ԥ�������
  �˥ޥå����Ƥ��ޤ����������ʸ����������ˤ�ޥå�����褦���ѹ�����
  �ޤ�����[[trap:Regexp]]
//emlist{
        p "\n".gsub(/\Z/, "o")
        => "o\n"   (1.6)
        => "o\no"  (1.8) # ����ʸ��������ʸ��������������1�󤺤�
//}

: \z

  ʸ����������$ �� \Z �Ȥϰۤʤ���Ԥ�̵ͭ�ˤϱƶ����ޤ���

: \b

  ʸ�����饹����γ��Ǥϸ춭�� (\w �� \W �Τ������˥ޥå�)��
  ʸ�����饹������ǤϥХå����ڡ��� (0x08)��

: \B

  ��춭��

: \G

  ����ޥå������ս�(��ľ��)�˥ޥå� (��������ʤ�)��
  ����������Ƭ���֤˥ޥå����ޤ�(\A��Ʊ��)��

  [[m:String#scan]] �䡢[[m:String#gsub]] �ǻ��ѤǤ��ޤ�������ޥå���
  �����θ夫��ޥå������������˻��Ѥ��ޤ���

  ��ñ��(���ޤ����Ω���ʤ�)��ϰʲ���
 
//emlist{
        # ��Ƭ����3�夺�Ĥο��ͤ�(���ͤ�³���¤�)���Ф���
        str = "123456 789"
        str.scan(/\G\d\d\d/) {|m| p m }
//}

: [ ]

  ʸ�����饹���ꡣ[[ref:string]]�򻲾ȡ�

: *

  ľ����ɽ���� 0 ��ʾ�η����֤����Ǥ������Ĺ���ޥå����褦�Ȥ��롣

: *?

  �̻����(quantifiers)��
  ľ����ɽ���� 0 ��ʾ�η����֤� (��û����)
//emlist{
        orig_str = "<b>Ruby</b> and <b>Perl</b>"
        p orig_str.gsub(/<b>(.*)<\/b>/, '<em>\1</em>')
        # => "<em>Ruby</b> and <b>Perl</em>"
        p orig_str.gsub(/<b>(.*?)<\/b>/, '<em>\1</em>')
        # => "<em>Ruby</em> and <em>Perl</em>"
//}

: +

  �̻����(quantifiers)��
  ľ����ɽ���� 1 ��ʾ�η����֤�

: +?

  �̻����(quantifiers)��
  ľ����ɽ���� 1 ��ʾ�η����֤� (��û����)

: {m}
: {m,}
: {m,n}

  �ϰϻ��귫���֤�����(interval quantifier)��
  ���줾��ľ��������ɽ����
        * m ��
        * m ��ʾ�
        * m ��ʾ塢���� n ��
  �η����֤���{,n} �䡢{,} ���Ф���ޥå���ɬ�����Ԥ��롣
//emlist{
        str = "foofoofoo"
        p str[/(foo){1}/]   # => "foo"
        p str[/(foo){2,}/]  # => "foofoofoo"
        p str[/(foo){1,2}/] # => "foofoo"
//}

  ����ɽ�� ?, *, + �Ϥ��줾�� {0,1}, {0,}
  {1,} ��Ʊ���Ǥ���

: {m}?
: {m,}?
: {m,n}?

  �ϰϻ��귫���֤�����(interval quantifier)��
  ���줾��ľ��������ɽ����
        * m ��
        * m ��ʾ�
        * m ��ʾ塢���� n ��
  �η����֤�(��û����)��

: ?

  �̻����(quantifiers)��
  ľ��������ɽ���� 0 �ޤ��� 1 ��η����֤���
//emlist{
        p /�ץ�󥿡�?��/s =~ "�ץ�󥿤�"     # => 0 (0ʸ���ܤ���ޥå�)
        p /�ץ�󥿡�?��/s =~ "�ץ�󥿡���"   # => 0
        p /�ץ�󥿡�?��/s =~ "�ץ�󥿡�����" # => nil
//}

: ??

  �̻����(quantifiers)��
  ľ��������ɽ���� 0 �ޤ��� 1 ��η����֤�(��û����)

: |

  ����(alternative)��ͥ���̤��㤤�Τǲ��Ρ֥��롼�ײ��פȤ��碌�ƻȤ����Ȥ�¿����
//emlist{
        /��(��|��)��/s =~ "�����פ�줵��"  # => 0 (0ʸ���ܤ���ޥå�)
        /��(��|��)��/s =~ "�����ץ�å���"  # => 0
        /����|����/s   =~ "�����פ�줵��"  # => 2 (�֥����פޤ��ϡ֥��ס�)
        /����|����/s   =~ "�����ץ�å���"  # => 0
//}

: ( )

  ����ɽ���Υ��롼�ײ�����̤��������ɽ���˥ޥå�����ʸ����ϸ�������
  �Τ���˵�������ޤ���

: \1, \2 ... \n

  ��������(back reference)��[[ref:backref]]�򻲾ȡ�

: (?# )

  �����ȡ���̤����Ǥ�դ�ʸ�����̵�뤵��ޤ���

: (?: )

  �������Ȥ�ȼ��ʤ����롼�ײ����Ĥޤꡢ\1, \2 (���뤤�ϡ�
  [[m:$1]], [[m:$2]])�ʤɤ��оݤˤϤʤ餺��
  ñ��ʥ��롼�ײ������Ӥǻ��Ѥ��ޤ���
//emlist{
        /(abc)/ =~ "abc"
        p $1
        => "abc"

        /(?:abc)/ =~ "abc"
        p $1
        => nil
//}

: (?= )

  ���ɤ�(lookahead)��
  �ѥ�����ˤ����ֻ���(��������ʤ�)
//emlist{
        (?=re1)re2
//}
  �Ȥ���ɽ���ϡ�re1 �� re2 ξ���˥ޥå������Τ˥ޥå���������ɽ����
  ����
//emlist{
        re1(?=re2)
//}
  �Ȥ���ɽ���ϡ���� re2 �ȥޥå�����ʸ����³��������ɽ�� re1 �Ǥ���
//emlist{
        p /foo(?=bar)/ =~ "foobar"      # => 0
        p $&    # => "foo"   (bar ����ʬ�ξ���Ϥʤ�)
//}

: (?! )

  �������ɤ�(negative lookahead)��
  �ѥ����������ˤ����ֻ���(��������ʤ�)
//emlist{
        (?!re1)re2
//}
  �Ȥ���ɽ���ϡ�re1 �˥ޥå����ʤ��� re2 �ˤϥޥå���������ɽ���Ǥ���
//emlist{
        # 000 ����� 3 ��ο���
        re = /(?!000)\d\d\d/
        p re =~ "000"   # => nil
        p re =~ "012"   # => 0
        p re =~ "123"   # => 0

        # C ����μ��̻� ([A-Za-z_] �ǻϤޤꡢ[0-9A-Za-z_] ��³��ʸ����)
        /\b(?![0-9])\w+\b/
//}

: (?> )

  [[ref:backtrack]]���޻ߤ��롣

  ����ɽ���Ϥޤ��������Ǥ�������ʤ��ʤ��ǽ���⤢��ޤ��Τǡ�
  ���ΤĤ��ǻȤäƤ����������ä����ѥ饤�֥��ʤɤǻȤäƤϤ����ޤ���

: (?ixm-ixm)

  ����ɽ����Ǥ�i���ץ����x���ץ����m���ץ�����on/off�����ץ���
  ��ˤĤ��Ƥ�[[ref:d:spec/literal#regexp]]�򻲾ȡ�
//emlist{
      re = /A(?i)a(?-i)A/
      p re =~ "AaA"         # => 0
      p re =~ "AAA"         # => 0
      p re =~ "AAa"         # => nil
//}

: (?ixm-ixm: )

  ������i���ץ����x���ץ����m���ץ�����on/off����̤��ϰ���
  ������
//emlist{
      re = /A(?i:a)A/
      p re =~ "AaA"         # => 0
      p re =~ "AAA"         # => 0
      p re =~ "AAa"         # => nil
//}

===[a:backref] ��������

����ɽ�� \1 \2 ... \n �ϡ��������ȤǤ���n ���ܤγ��(����
ɽ�� ( ) ���롼�ԥ�)�˥ޥå�����ʸ����˥ޥå����ޤ���

   /((foo)bar)\1\2/

�ϡ�

   /((foo)bar)foobarfoo/

��Ʊ���Ǥ���

��:

   re = /(foo|bar|baz)\1/
   p re =~ 'foofoo'   # => 0
   p re =~ 'barbar'   # => 0
   p re =~ 'bazbaz'   # => 0
   p re =~ 'foobar'   # => nil

�б������̤ϡ��������Ȥ��⺸¦�ˤʤ��Ȥ����ޤ���

�б������̤���˸������Ȥ�����о�˥ޥå��˼��Ԥ��ޤ���
�ޤ����б������̤��ʤ� 1 ��θ������Ȥ��˥ޥå��˼��Ԥ��ޤ���

        p /(\1)/ =~ "foofoofoo" # => nil
        p /(foo)\2/ =~ "foo\2"  # => nil

2 ��ʾ�θ������Ȥ����Ǥ��ޤ������Хå�����å��嵭ˡ
�� \nnn (8�� nnn ���б�����ʸ��)�Ⱥ�Ʊ���ʤ��褦�����դ���ɬ�פ�
����ޤ������ͤ� 1 ��ʤ��˸������ȤǤ���2 ��ʾ�λ���Ǥϡ��б���
���̤��ʤ���� 8 �ʥ����ɤȸ��ʤ���ޤ���

�ޤ����դ�����ɽ����� 8 �ʤ� 1 ��Υ����ɤ򵭽Ҥ���ˤ� \01 �ʤ� 0 ��
�Ϥ��ɬ�פ�����ޤ�(\0 �Ȥ����������ȤϤʤ��Τ�ۣ��ˤʤ�ޤ���)��

        p   /\1/ =~ "\1"   # => nil     # �б������̤Τʤ���������
        p  /\01/ =~ "\1"   # => 0       8 �ʥ�����
        p  /\11/ =~ "\11"  # => 0       8 �ʥ�����

        # 8 �ʥ����� (�б������̤��ʤ��Τ�)
        p /(.)\10/ =~ "1\10" # => 0

        # �������� (�б������̤�����Τ�)
        p /((((((((((.))))))))))\10/ =~ "aa"  # => 0

        # 8 �ʥ�����(��������"\0" + "8" �ˤʤäƤ���
        # \08 �Ȥ��� 8 �ʥ����ɤϤʤ��Τ�)
        p /(.)\08/ =~ "1\0008" # => 0

        # �������Ȥ�³���ƿ�����񤭤����ʤ��̤ǥ��롼�ײ����ƶ��ڤ�
        # �ʤɤ��뤷���ʤ���
        p /(.)(\1)1/ =~ "111"   # => 0

===[a:string] ʸ�����饹

����ɽ�� [ ] �ϡ�ʸ�����饹����Ǥ���[] �����󤷤������줫�ΰ�
ʸ���˥ޥå����ޤ���

�㤨�С�/[abc]/ �ϡ�"a", "b", "c" �����줫��ʸ���˥ޥå����ޤ���
ASCII�����ɽ��Ϣ³����ʸ����ϴ֤� `-' ���֤��� /[a-c]/ �Τ褦�˽�
�����Ȥ�Ǥ��ޤ����ޤ�����Ƭ�� `^' �Ǥ���л��ꤷ��ʸ���ʳ��ΰ�ʸ��
�ȥޥå����ޤ���

��Ƭ�ʳ��ˤ��� `^' �Ϥ���ʸ�����Τ�Τȥޥå����ޤ����ޤ�����Ƭ������
�ˤ��� `-' �ϡ�����ʸ�����Τ�Τȥޥå����ޤ���

   p /[a^]/ =~ "^"   # => 0
   p /[-a]/ =~ "-"   # => 0
   p /[a-]/ =~ "-"   # => 0
   p /[-]/ =~ "-"   # => 0

����ʸ�����饹�ϥ��顼�ˤʤ�ޤ���

   p /[]/ =~ ""
   p /[^]/ =~ "^"
   # => invalid regular expression; empty character class: /[^]/

��Ƭ(���뤤������� "^" ��ľ��)�ˤ��� "]" �ϡ�ʸ�����饹�ν���ǤϤʤ�
"]" ���Τ�Τ�ɽ���ޤ���
#@#((-((<ruby 1.8 feature>)) ���Τ褦�� "]" �ϡ��Хå�����å��奨������
#@#�פ�Ԥ����Ȥ��侩����ޤ���ruby 1.8 �Ǥϡ����������פ��ʤ� "[" �� "]"
#@#���Ф��Ʒٹ𤬽Ф�褦�ˤʤ�ޤ�����-))

   p /[]]/ =~ "]"       # => 0
   p /[^]]/ =~ "]"      # => nil

"^", "-", "]" ������ "\\"(�Хå�����å���)�ϡ��Хå�����å���ǥ���
�����פ��ơ�����ʸ���˥ޥå������뤳�Ȥ��Ǥ��ޤ���

   p /[\^]/ =~ "^"   # => 0
   p /[\-]/ =~ "-"   # => 0
   p /[\]]/ =~ "]"   # => 0
   p /[\\]/ =~ "\\"  # => 0

[] ��ˤ�ʸ�����Ʊ���Хå�����å��嵭ˡ�ȡ�
����ɽ�� \w, \W, \s, \S, \d, \D (������ʸ�����饹��ά��ˡ�Ǥ�)��
���ѤǤ��ޤ���
#@#((- ʸ�����饹����Ǥ� . �� * �ϥХå�����å���ǥ��������פ���
#@#ɬ�פϤ���ޤ���(���Ƥ⹽���ޤ���) -))

����ˤ��ʲ��Τ褦��ʸ�����饹�ϲ���ʸ���ˤ�ޥå����뤳�Ȥ�
���դ��Ƥ�������(����ɽ�� \W,\D ��Ʊ��)��

  p /[^a-z]/ =~ "\n"    # => 0

ʸ�����饹����Ǥϰʲ����ü�ʻ��꤬���ѤǤ��ޤ��������ε�ǽ�Ͼ�����Ϥ�
�ƥ��ݡ��Ȥ����Ȥ���«����Ƥ��ޤ���(�ʤΤǤ����ǤϾܺ٤Ͻ񤭤ޤ���
�ܺ٤��Τꤿ������ [[man:grep(1)]] ���Υޥ˥奢��򻲾Ȥ���
��������)��

      [:alnum:]  �����ȥ���ե��٥å� 0-9a-zA-Z
      [:alpha:]  ����ե��٥å� a-zA-Z
      [:blank:]  ������
      [:cntrl:]  ����ȥ�����ʸ��
      [:digit:]  ����
      [:graph:]  ��������������ǽ�ʲĻ�ʸ��
      [:lower:]  ��ʸ��
      [:print:]  �Ļ�ʸ��
      [:punct:]  ����
      [:space:]  ����ʸ��
      [:upper:]  ��ʸ��
      [:xdigit:] 16��ʸ��

��: ("[]" ��ޤ�� "[:...:]" ��1ʸ����ɽ���Ƥ��뤳�Ȥ����ա�
ʸ�����饹�� "[]" �ǤϤʤ�)

      p /[[:alnum:]][[:cntrl:]]/ =~ "a\x01"  # => 0

��: ����ʸ���Ϲ�θ����ޤ�������ɽ���������˥ޥå�����褦�˻��ꤵ
��Ƥ��Ƥ� [:alpha:] �ʤɤϡ����ѤΥ���ե��٥åȤȤϥޥå����ޤ���

      p /[[:alpha:]]/e =~ "��"        # => nil

===[a:backtrack] �Хå��ȥ�å�

#@#((-[[unknown:ruby-list:28084]] �ʲ��Υ���åɤ⻲�Ȥ��Ƥ���������-))

(?> ) �Ȥ����ü�ʳ�̤�����ɽ���򤫤���ȡ����γ�̤����ɽ����
�ޥå�������ʬ�ǤϥХå��ȥ�å���������ޤ��󡣤��ΰ�̣�����󤲤�
���Ƥߤޤ���

�㤨���̾������ɽ���Ǥ�

 p /(a*)ab/ === 'aaab'

�ϥޥå����ޤ������β����ϰʲ��Τ褦�ˤʤ�ޤ���

 (1) ����ɽ�� a* ������ǥå��� 0 �� a �ߤäĤ˥ޥå�����
 (2) ����ɽ�� a ���ޥå��˼���
 (3) ����ɽ�� a* ���ޥå�����ʬ�򾯤��֤�����ᤵ���ơס�
     a �դ��Ĥ˥ޥå������� (�Хå��ȥ�å�����)
 (4) ����ɽ�� a �� a �˥ޥå�����
 (5) ����ɽ�� b �� b �˥ޥå�����

��������������ɽ���γ�̤� (?> ) ���Ѥ���ȥޥå����ʤ��ʤ�ޤ���
���β����ϰʲ��Τ褦�ˤʤ�ޤ���

 (1) ����ɽ�� a* ������ǥå��� 0 �� a �ߤäĤ˥ޥå�����
 (2) ����ɽ�� a ���ޥå��˼���
 (3) a* ���ޥå�����ʬ�򤹤������餷�ƻ��������
     �޻߻��ꤵ��Ƥ���ΤǤ����˼��Ԥ���
 (4) ����ɽ�� a* ������ǥå��� 1 �� a �դ��Ĥ˥ޥå�����

�ʲ�Ʊ���褦�˼��Ԥ��ơ��ǽ�Ū�˥ޥå����Τ����Ԥ��ޤ���

�Ҥ餿�������ȡ��̾������ɽ���δ��ܤ�����ĥ��ޥå��פʤΤ��Ф��ơ�
(?> ) �ϰ���ä���Τ����Ф�Υ���ʤ���Ķ��ĥ��ޥå��פ�Ԥ��ޤ���

===[a:sample] ����ץ�

#@#((-���Υ���ץ�ϡ־�������ɽ�������ǡפ�����Ѥ��뤤�ϻ��ͤˤ�����ĺ����-))

�����ˤ����륵��ץ��ή�Ѥ��䤹���褦�� $re_ �ǻϤޤ륰�����Х�
�ѿ������ꤹ�뤳�Ȥˤ��Ƥ��롣

==== ����

��ư��������(������ޤ�)

        $re_float = /[-+]?(?:[0-9]+(\.[0-9]*)?|(\.[0-9]+))([eE][-+]?[0-9]+)?/

        p $re_float =~ "1.23"    # => 0
        p $&.to_f                # => 1.23
        p $re_float =~ ".23"     # => 0
        p $&.to_f                # => 0.23
        p $re_float =~ "1.23e1"  # => 0
        p $&.to_f                # => 12.3
        p $re_float =~ "1.23e-1" # => 0
        p $&.to_f                # => 0.123

==== ������ 3 �夺�ĥ���ޤǶ��ڤ�

��ˡ1: ����ɤߤ����ɤߤ����Ѥ�����ˡ (����ɤ�(lookbehind)�� Oniguruma
#@#  ((-Oniguruma �Ͼ����᤬��ȯ���Ƥ�������ɽ���饤�֥��ǡ�
#@#  ���� Ruby ������ɽ�����󥸥�ˤʤ�ͽ��� 1.9.0 �ˤϴ��˼����ޤ�Ƥ��ޤ���
#@#  [[m:URL:ftp:#/ftp.ruby-lang.org/pub/ruby/contrib/]]onigd* ����
#@#  CVS [[unknown:ruby-cvs:oniguruma]]
#@#  ��������Ǥ��롣Oniguruma ������ɽ���ˤĤ��Ƥ�
#@#  [[unknown:"ruby-cvs:oniguruma/doc/RE"]]�򻲾ȡ�
#@#  [[m:URL:http:#/www.geocities.jp/kosako3/oniguruma/]]-))
��ɬ��)

        p "tone of 12345Hz".gsub(/(?<=\d)(?=(?:\d\d\d)+(?!\d))/, ',')
        => ruby 1.8.0 (2003-08-07) [i586-linux]
           "tone of 12,345Hz"

��ˡ2: ���ɤߤ��������Ѥ�����ˡ

        p "tone of 12345Hz".gsub(/(\d)(?=(?:\d\d\d)+(?!\d))/, '\1,')
        => ruby 1.8.0 (2003-08-07) [i586-linux]
           "tone of 12,345Hz"

��ˡ3: ���ɤߤ����Ѥ��ʤ���ˡ

        s = "tone of 12345Hz"
        nil while s.gsub!(/(.*\d)(\d\d\d)/, '\1,\2')
        p s
        => ruby 1.8.0 (2003-08-07) [i586-linux]
           "tone of 12,345Hz"