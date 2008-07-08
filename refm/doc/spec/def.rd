= ���饹���᥽�åɤ����

  * [[ref:class]]
  * [[ref:singleton_class]]
  * [[ref:module]]
  * [[ref:method]]
  * [[ref:operator]]
  * [[ref:nest_method]]
  * [[ref:eval_method]]
  * [[ref:singleton_method]]
  * [[ref:class_method]]
  * [[ref:limit]]

����˴ؤ������:
  * [[ref:alias]]
  * [[ref:undef]]
  * [[ref:defined]]

===[a:class] ���饹���

��:

          class Foo < Super
            def test
               :
            end
               :
          end

ʸˡ:

          class ���̻� [`<' superclass ]
            ��..
          end

#@since 1.8.0
ʸˡ:

          class ���̻� [`<' superclass ]
            ��..
          [rescue [error_type,..] [=> evar] [then]
            ��..]..
          [else
            ��..]
          [ensure
            ��..]
          end
#@end

���饹��������ޤ������饹̾�ϥ���ե��٥åȤ���ʸ���ǻϤޤ뼱�̻ҤǤ���
#@since 1.8.0
rescue/ensure ������Ǥ��ޤ���
#@end

���饹����ϡ����̻Ҥǻ��ꤷ������ؤΥ��饹�������ˤʤ�ޤ�
(Ruby �Ǥϡ����饹�⥪�֥������Ȥΰ�Ĥ� [[c:Class]]���饹��
���󥹥��󥹤Ǥ�)��

���饹�������������Ƥ���Ȥ��������Ʊ�����饹̾�ǥ��饹�����񤯤ȥ�
�饹��������ɲäˤʤ�ޤ��������������Υ��饹�Ȱۤʤ륹���ѡ����饹��
����Ū�˻��ꤷ���������ȡ����Υ��饹�Ȥϰۤʤ뿷���ʥ��饹��Ʊ̾����
�����뤳�Ȥˤʤ�ޤ������ΤȤ������饹̾��������񤭤��뤳�Ȥˤʤ��
�Ƿٹ��å��������Фޤ���

        class Foo < Array
          def foo
          end
        end

        # ������ɲ�(�����ѡ����饹 Array ������Ū�˻��ꤷ�Ƥ�Ʊ��)
        class Foo
          def bar
          end
        end

        # �̤Υ��饹�����(�����ѡ����饹���ۤʤ�Τ�)
        class Foo < String
        end
        # => warning: already initialized constant Foo

���饹���������� self �����Υ��饹�Ǥ��뤳�Ȥȡ�
[[ref:limit]]�Υǥե���Ȥ��ۤʤ뤳�Ȱʳ�
�˥ȥåץ�٥�Ȥΰ㤤�Ϥ���ޤ��󡣥��饹�������ˤ�Ǥ�դμ���񤯤�
�Ȥ��Ǥ����饹����κݤ˼¹Ԥ���ޤ���

���饹����ϥͥ���(�����)�ˤ�������Ǥ��ޤ����ʲ����������Ҥγ�¦��
���饹 Foo ����¦�Υ��饹 Bar �δ֤ˤϡ���� Bar �� Foo ��������
Foo::Bar �Ǥ��뤳�Ȱʳ����Ѿ��ط��ʤɤε�ǽŪ�ʴ�Ϣ�Ϥޤä�������ޤ���

        class Foo
          class Bar
          end
        end

#@since 1.8.0
���饹 Foo �������������Ƥ���С��ʲ��ν�����Ǥ��ޤ���

        class Foo
        end

        class Foo::Bar
        end
#@end

���饹�Υͥ��Ȥϡ���̣Ū�˴�Ϣ���륯�饹��¦�Υ��饹���⥸�塼��Ǥ�
�ȤޤȤޤ�ˤ����ꡢ��޴ط���ɽ������˻��Ѥ���ޤ���

        # ��Ϣ���륯�饹�� Net �Ȥ������ƥ���ˤޤȤ��
        # ���Τ褦�ʾ��ϳ�¦�����̥⥸�塼�뤬���Ѥ����
        # (Net �Υ��󥹥��󥹤��ʤ���Net �� include �Ǥ���ʤɤΤ���)
        module Net
          class HTTP
          end
          class FTP
          end
        end

        obj = Net::HTTP.new

        # ���뤤��

        include Net
        obj = HTTP.new

        # �ʲ��Τ褦�ʻȤ������Ȥ߹��ߤΥ��饹�ˤ⸫����
        # ���ѼԤ� File::Constants �� include ���뤳�Ȥǡ�
        # File::RDONLY �ʤɤȽ񤫤���ľ�� RDONLY �Ƚ񤯤��Ȥ��Ǥ��롣
        class File
          module Constants
             RDONLY = 0
             WRONLY = 1
          end
          include Constants
        end

        File.open("foo", File::RDONLY)

        # ���뤤��

        include File::Constants
        File.open("foo", RDONLY)

        # �嵭�Ϥ����ޤǤ���Ǥ��롣�ºݤ� File.open �ǤϤ����ؤ�
        # File.open("foo", "r") �Ȥ����������Ȥ���

#@since 1.8.0
���饹������ϡ��Ǹ��ɾ���������η�̤��֤��ޤ����Ǹ��ɾ��������
���ͤ��֤��ʤ����� nil ���֤��ޤ���
#@else
���饹��������ͤ��֤��ޤ���
#@end

===[a:singleton_class] �ðۥ��饹���

��:

          obj = Object.new # obj = nil �Ǥ��
          class << obj
            def test
               :
            end
               :
          end

ʸˡ:

          class `<<' expr
            ��..
          end

#@since 1.8.0
ʸˡ:

          class `<<' expr
            ��..
          [rescue [error_type,..] [=> evar] [then]
            ��..]..
          [else
            ��..]
          [ensure
            ��..]
          end
#@end

���饹�����Ʊ����ʸ������Υ��֥������Ȥ˥᥽�åɤ䥤�󥹥����ѿ���
���/�ɲä��ޤ������ι�ʸ����������������᥽�åɤ�����ϻ��ꤷ��
���֥������Ȥ��Ф��Ƥ���ͭ���ˤʤ�ޤ���
Object#clone �������������֥������Ȥˤϰ����Ѥ���ޤ�����
Object#dup �������������֥������Ȥˤϰ����Ѥ���ޤ���

#@since 1.8.0
rescue/ensure ������Ǥ��ޤ���
#@end

�ðۥ��饹������ϡ��Ǹ��ɾ���������η�̤��֤��ޤ����Ǹ��ɾ��������
���ͤ��֤��ʤ����� nil ���֤��ޤ���

===[a:module] �⥸�塼�����

��:

          module Foo
            def test
               :
            end
               :
          end

ʸˡ:

          module ���̻�
            ��..
          end

#@since 1.8.0
ʸˡ:

          module ���̻�
            ��..
          [rescue [error_type,..] [=> evar] [then]
            ��..]..
          [else
            ��..]
          [ensure
            ��..]
          end
#@end

�⥸�塼���������ޤ����⥸�塼��̾�ϥ���ե��٥åȤ���ʸ��
�ǻϤޤ뼱�̻ҤǤ���
#@since 1.8.0
rescue/ensure ������Ǥ��ޤ���
#@end

�⥸�塼������ϡ����̻Ҥǻ��ꤷ������ؤΥ⥸�塼��������ˤʤ�ޤ���
Ruby �Ǥϡ��⥸�塼��⥪�֥������Ȥΰ�Ĥ� [[c:Module]] ���饹�Υ��󥹥��󥹤Ǥ���
�⥸�塼�뤬����������줤��Ȥ��������Ʊ���⥸�塼��̾�ǥ⥸�塼����
����񤯤ȥ⥸�塼���������ɲäˤʤ�ޤ���

#@since 1.8.0
�⥸�塼��������ϡ��Ǹ��ɾ���������η�̤��֤��ޤ����Ǹ��ɾ��������
���ͤ��֤��ʤ����� nil ���֤��ޤ���
#@else
�⥸�塼����������ͤ��֤��ޤ���
#@end

===[a:method] �᥽�å����

��:

          def fact(n)
            if n == 1 then
               1
            else
              n * fact(n-1)
            end
          end

ʸˡ:

          def �᥽�å�̾ [`(' [arg0 ['=' default0]] ... [`,' `*' rest_args] [',' '&' block_arg]`)']
            ��.. (body)
          [rescue [error_type,..] [=> evar] [then]
            ��..]..
          [else
            ��..]
          [ensure
            ��..]
          end

��������Τ�����˥᥽�åɤ�������ޤ������ʤ�������饹/�⥸�塼��
�����ʤ�Ф��Υ��饹/�⥸�塼��Υ᥽�åɤ�������ޤ����ȥåץ�٥�
�ʤ�Фɤ�����Ǥ�Ƥ٤�᥽�åɤ�������ޤ������Τ褦�ʥ᥽�åɤϷ��
�Ȥ���¾�θ���ˤ�����ִؿ��פΤ褦�˻Ȥ��ޤ���

��:

          def hello    # �����Τʤ��᥽�åɡ�
            puts "Hello, world!"
          end

          def foo(a, b)    # �����Τ���᥽�åɡ���̤�ʤ���def foo a, b�Ȥ�
            a + 3 * b
          end

�᥽�å�̾�Ȥ��Ƥ��̾�μ��̻Ҥ�¾�ˡ��������ǽ�ʱ黻��(��: ==, +, -
�ʤ� [[d:spec/operator]] �򻲾�)�����Ǥ��ޤ�([[ref:operator]]����)��

��:

          class Vector2D
            attr_accessor :x, :y   # ���󥹥����ѿ�@x, @y���б����륲�å��ȥ��å������
            def initialize(x, y)   # ���󥹥ȥ饯��
              @x = x; @y = y   # @���Ĥ��Τ����󥹥����ѿ��ʥ����ѿ���
            end
            def ==(other_vec)   # ������黻�ҥ����С��饤��
              other_vec.x == @x && other_vec.y == @y
            end
            def +(other_vec)
              Vector2D.new(other_vec.x + @x, other_vec.y + @y)
            end
            ...
          end
          vec0 = Vector2D.new(10, 20); vec1 = Vector2D.new(20, 30)
          p vec0 + vec1 == Vector2D.new(30, 50) #=> true

�������˥ǥե���ȼ���Ϳ����줿��硢�᥽�åɸƤӽФ��Ǽ°������ά��
���Ȥ��Υǥե�����ͤˤʤ�ޤ���
�������°����Ȥ��б����뤿�ᡢi���ܤΰ����˥ǥե�����ͤ���ꤷ���ʤ�С�
i+1���ܰʹߤǤ����ƥǥե�����ͤ���ꤹ�뤫������Ĺ���������Ѥ��ʤ���Фʤ�ޤ���ʾܺ٤ϸ�ҡˡ�
�ǥե���ȼ���ɾ���ϸƤӽФ����˥᥽�å������Υ���ƥ����ȤǹԤ��ޤ���

��:

          def foo(x, y = 1)    # 2���ܤΰ���y�˥ǥե�����ͤ����
            10 * x + y
          end
          p foo(1, 5)  #=> 15
          p foo(3)     #=> 31
          p foo        #=> ArgumentError (wrong number of arguments)

          $gvar = 3
          def bar(x, y = $gvar)  # �Τ���������ˤ�$gvar == 3����
            10 * x + y
          end
          $gvar = 7
          # �ƤӽФ�����$gvar���ͤ��Ȥ���
          p bar(5)   #=> 57 (!= 53)

�Ǹ�β�������ľ���� * ��������ˤϻĤ�μ°����Ϥߤ�����Ȥ�
�Ƥ��ΰ����˳�Ǽ����ޤ���
����Ĺ�����ʤɤȸƤФ�뵡ǽ�Ǥ���

��:

         def foo(x, *xs)
           puts "#{x} : #{xs.inspect}"   # Object#inspect �� p �Τ褦�ʾܺ٤�����ɽ��
         end
         foo(1)        #=> 1 : []
         foo(1, 2)     #=> 1 : [2]
         foo(1, 2, 3)  #=> 1 : [2, 3]

         def bar(x, *) # �Ĥ�ΰ�����ñ��̵�뤷�����Ȥ�
           puts "#{x}"   
         end
         bar(1)        #=> 1 
         bar(1, 2)     #=> 1
         bar(1, 2, 3)  #=> 1

�Ǹ�β�������ľ���� & ������Ȥ��Υ᥽�åɤ�Ϳ�����Ƥ���֥���
������³�����֥�������([[c:Proc]])�Ȥ��Ƥ��ΰ����˳�Ǽ����ޤ�������ϡ�
���ƥ졼�������������ˡ�ΰ�ĤǤ������ƥ졼�������������ɽŪ����ˡ�� 
yield ��ƤӽФ����ȤǤ���
¾�� [[m:Proc.new]]/[[m:Kernel.#proc]] ��Ȥ���ˡ�ʤɤ⤢��ޤ���
�֥��å���Ϳ�����ʤ��ä����Υ֥��å��������ͤ�nil�Ǥ���

��:

          def foo(cnt, &block_arg)
            cnt.times { block_arg.call } # �֥��å��˼��ޤä�Proc���֥������Ȥ�call�Ǽ¹�
          end
          foo(3) { print "Ruby! " } #=> Ruby! Ruby! Ruby!

�᥽�å�����ˤ����ơ��������Ϥ��μ�����˰ʲ��ν���Ǥ������ꤹ�뤳��
�ϤǤ��ޤ��󡣤�������ά���뤳�Ȥϲ�ǽ�Ǥ���

    * �ǥե���ȼ��Τʤ�����(ʣ�������)
    * �ǥե���ȼ��Τ������(ʣ�������)
    * * ��ȼ������(1�Ĥ��������)
    * & ��ȼ������(1�Ĥ��������)

��:

          # ���٤ƻ���
          def foo(arg0, arg1, arg2 = 10, *rest, &block)
            block.call if block
            puts "#{arg0}: #{arg1}: #{arg2}?: #{rest.inspect}"
          end
          foo(1, 2, 3, 4, 5) { print "Args are " }  #=> Args are 1: 2: 3?: [4, 5]

��: ���ƥ졼�������

          # yield ��Ȥ�
          def foo
          # block_given? �ϡ��᥽�åɤ��֥��å����Ϥ����
          # �ƤФ줿���ɤ�����Ƚ�ꤹ���Ȥ߹��ߴؿ�
            if block_given?
              yield(1,2)
            end
          end

          # Proc.new ��Ȥ�
          def bar
            if block_given?
              Proc.new.call(1,2)    # proc.call(1,2) �Ǥ�Ʊ��(proc ���Ȥ߹��ߴؿ�)
            end
          end

          # ����: �����Ȥ��� Proc ���֥������Ȥȥ֥��å���
          # ξ��������դ��륤�ƥ졼�������������
          def foo(block = Proc.new)
            block.call(1,2)
          end
          foo(proc {|a,b| p [a,b]})
          foo {|a,b| p [a,b]}

          # �֥��å�������Ȥ�
          def baz(&block)
            if block
              block.call(1,2)
            end
          end

�ޤ��᥽�åɼ¹Ի����㳰����ª���뤿��� begin ����Ʊ��
��rescue, else, ensure ������Ǥ��ޤ���

#@since 1.8.0
�᥽�å�������ϡ�nil ���֤��ޤ���
#@else
�᥽�å���������ͤ��֤��ޤ���
#@end

====[a:operator] �黻�Ҽ������

[[d:spec/operator]]�ˤ����ơ��ֺ������ǽ�ʱ黻�ҡפ�ʬ�व�줿�黻�Ҥμ���
�ϥ᥽�åɤʤΤǡ�������뤳�Ȥ���ǽ�Ǥ���

�����α黻�Ҽ�������������ʲ��˵󤲤ޤ���

          # ���黻��
          def +(other)                # obj + other
          def -(other)                # obj - other

          # ñ��ץ饹/�ޥ��ʥ�
          def +@                      # +obj
          def -@                      # -obj

          # ��������
          def foo=(value)             # obj.foo = value

          # [] �� []=
          def [](key)                 # obj[key]
          def []=(key, value)         # obj[key] = value
          def []=(key, key2, value)   # obj[key, key2] = value

          # �Хå��������ȵ�ˡ
          def `(arg)                  # `arg` �ޤ��� %x(arg)

�Хå��������ȵ�ˡ�μ����ϥ᥽�åɤʤΤǤ��Τ褦�˺��������ǽ�Ǥ�����
�̤Ϥ��Υ᥽�åɤ���������٤��ǤϤ���ޤ��󤬡��ޤ��OS(������)�Υ�
�ޥ�ɼ¹Ԥε�ư���Զ�礬������ʤɤ����ѤǤ��ޤ���
#@#((- �ºݤα����㤬[[unknown:ruby-talk:10006]],[[unknown:ruby-dev:12829]]�ˤ���ޤ�-))

====[a:nest_method] �᥽�å�����Υͥ���

#@since 1.8.0
�ͥ��Ȳ�ǽ�Ǥ����ͥ��Ȥ��줿������ϡ�
�������������᥽�åɤ��¹Ԥ��줿�����������ޤ������Τ��Ȥ�����С�
���̤Υ᥽�å��������Ʊ���Ǥ����ʲ�����򻲾Ȥ��Ƥ���������
#@else
[[ref:singleton_method]]������᥽�å�������ϥͥ��ȤǤ��ޤ���
#@end
#@#version 1.8.0 �ˤϡ��ͥ��Ȥ�����������᥽�åɤ� Object �Υ��󥹥���
#@#�᥽�åɤˤʤ�Ȥ����Х�������ޤ���-))

#@since 1.8.0
        class Foo
          def foo
            def bar
              p :bar
            end
          end

          def Foo.method_added(name)
            puts "method \"#{name}\" was added"
          end
        end
        obj = Foo.new
        obj.bar rescue nil # => undefined method `bar' for #<Foo:0x4019eda4>
        obj.foo            # => method "bar" was added
        obj.foo            # => warning: method redefined; discarding old bar
        Foo.new.bar        # => :bar  (¾�Υ��󥹥��󥹤Ǥ�����Ѥ�)

#@else
version 1.6 �����ϡ�Ʊ�����Ȥ�Ԥ��Τ� [[m:Object#instance_eval]] ���
��ɬ�פ�����ޤ���(���ξ���ðۥ᥽�åɤ���������ΤǾ����ۤʤ�ޤ�)��

        class Foo
          def foo
            instance_eval <<-END
              def bar
                p :bar
              end
            END
          end
        end

        obj = Foo.new
        def obj.singleton_method_added(name)
            puts "singleton method \"#{name}\" was added"
        end                # => singleton method "singleton_method_added" was added

        obj.bar rescue nil # => undefined method `bar' for #<Foo:0x4019eda4>
        obj.foo            # => singleton method "bar" was added

        obj.foo            # => warning: method redefined; discarding old bar
                           # => singleton method "bar" was added
        Foo.new.bar        # => undefined method `bar' for #<Foo:0x4019eda4>

�ޤ��ϡ��ʲ��Τ褦�˽񤯤��Ȥ�Ǥ��ޤ���
#@#1.6 �����ϡ�def ����� def ����
#@#parser �ǵ�����ʤ��ä��ΤǤ��Τ褦�˽񤯤��ȤϤǤ��ޤ���Ǥ���

       class Foo
          def foo
            instance_eval {
              def bar
                p :bar
              end
            }
          end
        end
#@end

====[a:eval_method] �᥽�åɤ�ɾ��

�᥽�åɤ��ƤӽФ����ȡ��ʲ��ν�Ǽ���ɾ������ޤ���

 * ���ꤵ��Ƥ���а����Υǥե���ȼ�
 * �᥽�åɤ����� body
 * ���ꤵ��Ƥ�����㳰��ȯ����̵ͭ�ˤ��᥽�å�������� rescue
   ��ޤ��� else ��
 * ���ꤵ��Ƥ���� ensure ��

�����Υǥե���ȼ���ޤᡢ���٤Ƥ��Υ᥽�åɤΥ���ƥ����Ȥ�ɾ������ޤ���

�᥽�åɤ�����ͤ� return ���Ϥ����ͤǤ���return ���ƤӽФ���ʤ��ä����ϡ�
body �κǸ�μ����ͤ��֤��ޤ���
body �κǸ�μ����ͤ��֤��ʤ����ξ��� nil ���֤��ޤ���

�ޤ��᥽�åɤ�����������˸ƤӽФ����ȤϤǤ��ޤ����㤨��

          foo          # <- foo ��̤���
          def foo
            print "foo\n"
          end

��̤����᥽�åɤθƤӽФ����㳰 [[c:NameError]] ��ȯ�������ޤ���

===[a:singleton_method] �ðۥ᥽�å����

��:

          def foo.test
            print "this is foo\n"
          end

ʸˡ:

          def �� `.' ���̻� [`(' [���� [`=' default]] ... [`,' `*' ���� ]`)']
            ��..
          [rescue [error_type,..] [=> evar] [then]
            ��..]..
          [else
            ��..]
          [ensure
            ��..]
          end

�ðۥ᥽�åɤȤϥ��饹�ǤϤʤ���������Υ��֥������Ȥ˸�ͭ��
�᥽�åɤǤ����ðۥ᥽�åɤ�����ϥͥ��ȤǤ��ޤ���

���饹���ðۥ᥽�åɤϤ��Υ��֥��饹�ˤ�Ѿ�����ޤ���������
����Х��饹���ðۥ᥽�åɤ�¾�Υ��֥������Ȼظ������ƥ�ˤ�
���륯�饹�᥽�åɤ�Ư���򤹤뤳�Ȥˤʤ�ޤ���

#@since 1.8.0
�ðۥ᥽�å�������ϡ�nil ���֤��ޤ���
#@else
�ðۥ᥽�å���������ͤ��֤��ޤ���
#@end

===[a:class_method] ���饹�᥽�åɤ����

Ruby �ˤ����륯�饹�᥽�åɤȤϥ��饹���ðۥ᥽�åɤΤ��ȤǤ���Ruby ��
�ϡ����饹�⥪�֥������ȤʤΤǡ����̤Υ��֥������Ȥ�Ʊ�ͤ��ðۥ᥽�å�
������Ǥ��ޤ���

�������äơ����餫����ˡ�ǥ��饹���֥������Ȥ˥᥽�åɤ��������С���
�줬���饹�᥽�åɤȤʤ�ޤ�������Ū�ˤϰʲ��Τ褦�ˤ���������뤳�Ȥ�
����ޤ�(�⥸�塼���Ʊ�ͤǤ�)��

        # �ðۥ᥽�å�������
        class Hoge
          def Hoge.foo
          end
        end

        # ���饹����γ��Ǥ��ɤ�
        def Hoge.bar
        end

        # �ʲ��Τ褦�ˤ���Х��饹̾���Ѥ�äƤ�᥽�å������ѹ�������
        class Hoge
          def self.baz
            'To infinity and beyond!'
          end
        end

        # �ðۥ��饹������ʣ���Υ᥽�åɤ���٤��������Ȥ�����
        class << Hoge
          def bar
            'bar'
          end
        end

        # �⥸�塼��򥯥饹�� extend ����С��⥸�塼��Υ��󥹥���
        # �᥽�åɤ����饹�᥽�åɤˤʤ�
        module Foo
          def foo
          end
        end
        class Hoge
          extend Foo
        end

extend �ˤĤ��Ƥϡ�[[m:Object#extend]] �򻲾Ȥ���
����������

===[a:limit] �ƤӽФ�����

�᥽�åɤ� public��private��protected �λ��̤��
�ƤӽФ����¤�����ޤ���

 * public �����ꤵ�줿�᥽�åɤ����¤ʤ��˸ƤӽФ��ޤ���
 * private �����ꤵ�줿�᥽�åɤϴؿ������Ǥ����ƤӽФ��ޤ���
 * protected �����ꤵ�줿�᥽�åɤϡ����Υ᥽�åɤ���ĥ��֥�������
   �Υ᥽�å��������Ǥʤ���иƤӽФ��ޤ���

��: protected �βĻ���

        class Foo
          def foo
           p caller.last
          end
          protected :foo
        end

        obj = Foo.new

        # ���ΤޤޤǤϸƤ٤ʤ�
        obj.foo rescue nil    # => -:11 - private method `foo' called for #<Foo:0x401a1860> (NameError)

        # ���饹�����Ǥ�Ƥ٤ʤ�
        class Foo
          Foo.new.foo rescue nil # => -:15 - protected method `foo' called for #<Foo:0x4019eea8>
          # �᥽�å��������ǸƤ٤�
          def bar
            self.foo
          end
        end
        Foo.new.bar             # => ["-:21"]

        # �ðۥ᥽�å��������Ǥ�Ƥ٤�
        def obj.bar
          self.foo rescue nil
        end
        obj.bar                 # => ["-:27"]

#@#         class <<obj
#@#           def baz
#@#             self.foo rescue nil
#@#           end
#@#         end
#@#         obj.baz                 # => ["-:34"]
#@# 
#@#         module Baz
#@#           def baz
#@#             self.foo
#@#           end
#@#         end
#@#         class Foo
#@#           include Baz
#@#         end
#@#         Foo.new.baz             # => ["-:44"]

�ǥե���ȤǤ� def �������饹����γ�(�ȥåץ�٥�)�ˤ���� private��
���饹�������ˤ���� public ��������ޤ�������� [[m:Module#public]]��[[m:Module#private]]��
[[m:Module#protected]] ���Ѥ����ѹ��Ǥ��ޤ��������� [[m:Object#initialize]] �Ȥ���̾���Υ᥽�åɤ�
#@since 1.8.0
[[m:Object#initialize_copy]] �Ȥ���̾���Υ᥽�å�
#@end
�����������˴ط��ʤ���� private �ˤʤ�ޤ���

��:
          def foo           # �ǥե���Ȥ� private
          end

          class C
            def bar         # �ǥե���Ȥ� public
            end

            def ok          # �ǥե���Ȥ� public
            end
            private :ok     # �Ĥ����������� private ���Ѥ��

            def initialize  # initialize �� private
            end
          end

private �� protected ��Ʊ����Ū(���Υ᥽�åɤ򱣤��������
�٤ʤ��褦�ˤ���)�ǻ��Ѥ���ޤ������ʲ��Τ褦����Ǥϡ�private
�ϻȤ�����protected �����Ѥ���ɬ�פ�����ޤ���
���Τˤϡ�private �ˤϴؿ������������Ū�����뤬���Ƥ�
�Ф����¤���Ū�Ǥ�(�����˵󤲤����¤�����ˤ⤫����餺)
protected ���� private ���Ȥ��뤳�Ȥ�����¿���褦�Ǥ���

        class Foo
          def _val
            @val
          end
          protected :_val

          def op(other)

            # other �� Foo �Υ��󥹥��󥹤�����
            # _val �� private ���ȴؿ������Ǥ����Ƥ٤ʤ�����
            # ���Τ褦�����ѤǤ��ʤ�

            self._val + other._val
          end
        end

=== ����˴ؤ������

====[a:alias] alias

��:

          alias foo bar
          alias :foo :bar
          alias $MATCH $&

ʸˡ:

          alias ���᥽�å�̾ ��᥽�å�̾
          alias ���������Х��ѿ�̾ �쥰�����Х��ѿ�̾

�᥽�åɤ��뤤�ϥ������Х��ѿ�����̾��Ĥ��ޤ����᥽�å�̾��
�ϼ��̻Ҥ��Τ�Τ� [[c:Symbol]] ����ꤷ�ޤ�(obj.method �Τ�
���ʼ���񤯤��ȤϤǤ��ޤ���)��alias �ΰ����ϥ᥽�å�
�ƤӽФ����ΰ��ڤ�ɾ���ϹԤ��ޤ���

�᥽�åɤ���������̾���դ���ˤ�[[c:Module]]���饹�Υ᥽�å�
[[m:Module#alias_method]] �����Ѥ��Ʋ�������

��̾���դ���줿�᥽�åɤϡ����λ����ǤΥ᥽�å�����������
�������Υ᥽�åɤ����������Ƥ⡢��������θŤ��᥽�åɤ�Ʊ
��Ư���򤷤ޤ�������᥽�åɤ�ư����Ѥ������������᥽�å�
�Ǹ��Υ᥽�åɤη�̤����Ѥ������Ȥ��ʤɤ����Ѥ���ޤ���

    # �᥽�å� foo �����
    def foo
      "foo"
    end

    # ��̾������(�᥽�å����������)
    alias :_orig_foo :foo

    # foo ������(�������������)
    def foo
      _orig_foo * 2
    end

    p foo  # => "foofoo"

�������Х��ѿ��� alias �����ꤹ��Ȥޤä���Ʊ���ѿ����������ޤ�����
�Τ��Ȥϰ������ѿ��ؤ�������¾�����ѿ��ˤ�ȿ�Ǥ����褦�ˤʤ뤳�Ȥ��
̣���ޤ���
ź�ե饤�֥��� [[lib:importenv]] �Ϥ��Τ��Ȥ����Ѥ���[[unknown:�Ȥ߹����ѿ�]]
�˱Ѹ�̾��Ĥ��ޤ���

#@until 1.8.0
�������Х��ѿ�����̾�Ť���������Ȥ߹����ѿ��������оݤǤ���
#@end

    # �ü���ѿ��Υ����ꥢ���ϰ������ѹ���¾����ȿ�Ǥ����
    $_ = 1
    alias $foo $_
    $_ = 2
    p [$foo, $_]   # => [2, 2]

#@since 1.8.0
    $bar = 3
    alias $foo $bar
    $bar = 4
    p [$foo, $bar] # => [4, 4]
#@else
    # ��������̾���ѿ��Υ����ꥢ���������ΰ�̣�Ǥ�
    # �����ꥢ���ˤϤʤ�ʤ�������ϡ�version 1.6 ��
    # �Ǥ�����
    $bar = 3
    alias $foo $bar
    $bar = 4
    p [$foo, $bar] # => [3, 4]
#@end

������������ɽ������ʬʸ������б������ѿ� $1,$2, ... �ˤ���̾���դ��뤳�Ȥ��Ǥ��ޤ���
�ޤ������󥿥ץ꥿���Ф��ƽ��פʰ�̣�Τ��륰�����Х��ѿ� ([[unknown:�Ȥ߹����ѿ�]]�򻲾�) 
�����������ư��˻پ���褹��礬����ޤ���

alias ���� nil ���֤��ޤ���

====[a:undef] undef

��:

          undef bar

ʸˡ:

          undef �᥽�å�̾[, �᥽�å�̾[, ...]]

�᥽�åɤ��������ä��ޤ����᥽�å�̾�ˤϼ��̻Ҥ��Τ��
�� [[c:Symbol]] ����ꤷ�ޤ�(obj.method �Τ褦�ʼ���񤯤��ȤϤǤ��ޤ���)��
undef �ΰ����ϥ᥽�åɸƤӽФ����ΰ��ڤ�ɾ���ϹԤ��ޤ���

�᥽�åɤ��������������ä��ˤ�[[c:Module]]���饹�Υ᥽��
�� [[m:Module#undef_method]] �����Ѥ��Ʋ�
������

undef �Τ�����Τ�ư��ϡ��᥽�å�̾�ȥ᥽�å�����Ȥδط����������
���Υ᥽�å�̾���ü������ȴ�Ϣ�Ť��ޤ������ξ��֤Υ᥽�åɤθƤӽФ���
�㤨�����ѡ����饹��Ʊ̾�Υ᥽�åɤ����äƤ��㳰 [[c:NameError]] ��ȯ�������ޤ���
(�������᥽�å� [[m:Module#remove_method]] �ϡ��ط�������������Ǥ������ΰ㤤�Ͻ��פǤ�)��

alias �ˤ����̾����� undef �ˤ��������ä��ˤ�äƥ��饹�Υ��󥿥ե�������
�����ѡ����饹����Ω���ѹ����뤳�Ȥ��Ǥ��ޤ������������᥽�åɤ� self �˥�å�������
���äƤ�����⤢��Τǡ��褯���դ��ʤ��ȴ�¸�Υ᥽�åɤ�ư��ʤ��ʤ��ǽ��������ޤ���

undef ���� nil ���֤��ޤ���

====[a:defined] defined?

��:

          defined? print
          defined? File.print
          defined?(foobar)
          defined?($foobar)
          defined?(@foobar)
          defined?(Foobar)

ʸˡ:

          defined? ��

�����������Ƥ��ʤ���С������֤��ޤ����������Ƥ���м��μ���
��ɽ��ʸ������֤��ޤ���

�������Ƥ��ʤ��᥽�åɡ�undef ���줿�᥽�åɡ�[[m:Module#remove_method]] 
�ˤ�������줿�᥽�åɤΤ�������Ф��Ƥ� defined? �ϵ����֤��ޤ���

���̤���ˡ�Ȥ��ưʲ�������ޤ���

   defined? yield

yield �θƤӽФ�����ǽ�ʤ鿿(ʸ���� "yield")���֤��ޤ���
[[m:Kernel.#block_given?]] ��Ʊ�ͤ˥᥽�åɤ��֥��å��դ��ǸƤФ줿��
��Ƚ�Ǥ�����ˡ�ˤʤ�ޤ���

   defined? super

super �μ¹Ԥ���ǽ�ʤ鿿(ʸ���� "super")���֤��ޤ���

   defined? a = 1
   p a # => nil

"assignment" ���֤��ޤ����ºݤ������ϹԤ��ޤ��󤬥��������ѿ����������ޤ���

   /(.)/ =~ "foo"
   p defined? $&  # => "$&"
   p defined? $1  # => "$1"
   p defined? $2  # => nil

$&, $1, $2, �ʤɤ�ľ���Υޥå��η���ͤ����ꤵ�줿�����������֤��ޤ���

   def Foo(a,b)
   end
   p defined? Foo       # => nil
   p defined? Foo()     # => "method"
   Foo = 1
   p defined? Foo       # => "constant"

��ʸ���ǻϤޤ�᥽�å�̾���Ф��Ƥ� () ���������ʤ���������Ƚ��
��ԤäƤ��ޤ��ޤ���

�ʲ��ϡ�defined? ���֤��ͤΰ����Ǥ���

 * "super"
 * "method"
 * "yield"
 * "self"
 * "nil"
 * "true"
 * "false"
 * "assignment"
 * "local-variable"
 * "local-variable(in-block)"
 * "global-variable"
 * "instance-variable"
 * "constant"
 * "class variable"
 * "$&", "$`", "$1", "$2", ...
 * "expression"