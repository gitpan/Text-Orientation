use Test;
BEGIN { plan tests => 8 };
use Text::Orientation;
ok(1);

#########################
$text=<<'EOF';
���ȯ��
�@�⨯�Ĳ\
�����@�̷�
�ָѨ䤤��
EOF


$o = Text::Orientation->new( TEXT => $text,   CHARSET => 'Big5');
ok($o->transpose().$/, <<'EOF');
���@����
�ȧ⤪��
��@��
��Ī̤�
���\����
EOF

ok($o->anti_transpose().$/, <<'EOF');
�����\��
���̻ĭ�
��@����
�Ѥ����
�ֳ��@��
EOF

ok($o->rotate(1).$/, <<'EOF');
�ֳ��@��
�Ѥ����
��@����
���̻ĭ�
�����\��
EOF

ok($o->rotate(2).$/, <<'EOF');
������ѽ�
���̧@����
�\�Ĩ���@
�����Ⱥ�
EOF
ok($o->rotate(3).$/, <<'EOF');
���\����
��Ī̤�
��@��
�ȧ⤪��
���@����
EOF
ok($o->mirror('vertical').$/, <<'EOF');
�ָѨ䤤��
�����@�̷�
�@�⨯�Ĳ\
���ȯ��
EOF
ok($o->mirror('horizontal').$/, <<'EOF');
�����Ⱥ�
�\�Ĩ���@
���̧@����
������ѽ�
EOF

exit;


sub sep { $/.'-'x23,$/ };

print sep, $o->transpose();
print sep, $o->anti_transpose();
print sep, $o->rotate(1);
print sep, $o->rotate(2);
print sep, $o->rotate(3);
print sep, $o->mirror('vertical');
print sep, $o->mirror('horizontal');
print $/;
exit;



