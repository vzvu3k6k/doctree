= ReFe

ReFe�ˤĤ��Ƥ�
[[unknown:ReFe|URL:http://i.loveruby.net/ja/prog/refe.html]]
��������������

=== Gems��

Gems�򤪻Ȥ������ϡ���((%gem install refe%))�פǥ��󥹥ȡ���Ǥ��ޤ���
([[unknown:ruby-list:41478]])

=== Ruby ��ե���󥹥ޥ˥奢��θ����ġ��� ReFe �Υǡ������ۤˤĤ���

�ǿ� Ruby ��ե���󥹥ޥ˥奢���Ѥ� ReFe �Υǡ������ۤ���ˤϰʲ���
���ǹԤ��ޤ���(�ܺ٤� ReFe �� README �򻲾Ȥ��Ƥ�������)

(1) [[URL:http://i.loveruby.net/ja/prog/refe.html]] ���� ReFe �δ��ܥ��å�
    ���ä���ƥ��󥹥ȡ��뤷�ޤ���

        tar xvzf refe-x.x.x.tar.gz
        cd refe-x.x.x
        ruby setup.rb config
        ruby setup.rb setup
        (ɬ�פ˱����� root �ˤʤäƤ�������)
        ruby setup.rb install

(2) [[URL:http://www.ruby-lang.org/ja/man/man-rd-ja.tar.gz]]
    �ˤ���Τ��ǿ��Υ�ե���󥹥ޥ˥奢��� tarball �Ǥ���
    �����������ޤ���

(3) �������� man-rd-ja.tar.gz ��Ÿ������ReFe�ǡ����١������ۤ��ޤ���
    /usr/local/share/refe ��Ŭ���Ķ��˱������ѹ����Ƥ�������(�ѹ���������
    refe ��¹Ԥ���Τ˴Ķ��ѿ� REFE_DATA_DIR �����ꤹ��ɬ�פ�����ޤ�)

        gzip -dc man-rd-ja.tar.gz | tar xvf -
        cd man-rd-ja
        (ɬ�פ˱����� root �ˤʤäƤ�������)
        mkrefe_rubyrefm -d /usr/local/share/refe *.rd

    /usr/local/share/refe ���˰ʲ��Υǥ��쥯�ȥ�ȥե����뤬�Ǥ��ޤ���

        class_document/        method_document/
        class_document_comp    method_document_comp

(4) ��ϻȤ������Ǥ���

        refe IO puts
        IO#puts
        --- puts([obj[, ...]])

            �� obj �� self �˽��Ϥ����塢���Ԥ��ޤ���
            �����ΰ����� puts ��Ʊ���Ǥ�(�ܺ٤Ϥ�����򻲾Ȥ�
            �Ƥ�������)��

            nil ���֤��ޤ���

=== ReFe �� Emacs ���󥿥ե������Υ��󥹥ȡ�����ˡ

(1) refe.el ���ä����
    /usr/local/share/emacs/site-lisp �ʤɤ� Emacs Lisp �饤�֥����֤����
    ���֤��ޤ���

(2) .emacs �˰ʲ���񤤤Ƥ����ޤ���

      (require 'refe)

(3) ���������᥽�å�̾�ΰ��֤˹�碌�� M-x refe ��¹Ԥ��ޤ���