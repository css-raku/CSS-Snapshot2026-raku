#!/usr/bin/env perl6

use Test;

use CSS::Snapshot2026;
use CSS::Grammar::Test;
use CSS::Writer;
use JSON::Fast;

for "012AF", "012AFc" {
    # css21+ unicode is up to 6 digits
    ok  $_ ~~ /^<CSS::Snapshot2026::unicode>$/, "css4 unicode: $_";
}

# css1 and css21 only recognise latin chars as non-ascii (\o240-\o377)
for '' {
    ok  $_ ~~ /^<CSS::Snapshot2026::nonascii>$/, "non-ascii css3: $_";
}

my CSS::Module $module  = CSS::Snapshot2026.module;
my CSS::Writer $writer .= new( :terse, :color-names );

for 't/00basic.json'.IO.lines.map({ from-json($_).pairs[0] }) {

    my $rule = .key;
    my %expected = .value;
    my $input = %expected<input>;

    subtest $input, {

        my $suite = $module.name;
        my %level-tests = %( %expected{$suite} // () );
        my %level-expected = %expected, %level-tests;

        CSS::Grammar::Test::parse-tests($input,
                                        :$module,
                                        :$rule,
                                        :$writer,
                                        :expected(%level-expected) );
    }

}

done-testing;
