# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 7 };
use Text::Orientation;
ok(1); # If we made it this far, we're ok.

#########################
$text=<<EOF;
滿紙荒唐言
一把辛酸淚\
都云作者痴
誰解其中味
EOF


$o = Text::Orientation->new({  TEXT => $text,   CHARSET => 'Big5'});
ok($o->transpose().$/, <<EOF);
滿一都誰
紙把云解
荒辛作其
唐酸者中
言淚\痴味
EOF

ok($o->rotate(1).$/, <<EOF);
誰都一滿
解云把紙
其作辛荒
中者酸唐
味痴淚\言
EOF

ok($o->rotate(2).$/, <<EOF);
味中其解誰
痴者作云都
淚\酸辛把一
言唐荒紙滿
EOF
ok($o->rotate(3).$/, <<EOF);
言淚\痴味
唐酸者中
荒辛作其
紙把云解
滿一都誰
EOF
ok($o->mirror('vertical').$/, <<EOF);
誰解其中味
都云作者痴
一把辛酸淚\
滿紙荒唐言
EOF
ok($o->mirror('horizontal').$/, <<EOF);
言唐荒紙滿
淚\酸辛把一
痴者作云都
味中其解誰
EOF


exit;


sub sep { $/.'-'x23,$/ };

print sep, $o->transpose();
print sep, $o->rotate(1);
print sep, $o->rotate(2);
print sep, $o->rotate(3);
print sep, $o->mirror('vertical');
print sep, $o->mirror('horizontal');
print $/;
exit;



