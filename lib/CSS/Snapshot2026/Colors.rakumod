unit grammar CSS::Snapshot2026::Colors;

use  CSS::Module::CSS3::Colors;
also is CSS::Module::CSS3::Colors;

rule color:sym<rgb>  {<rgb>}
rule color:sym<rgba> {<rgba>}
rule color:sym<hsl>  {<hsl>}
rule color:sym<hsla> {<hsla>}

class Actions {
    also is CSS::Module::CSS3::Colors::Actions;
    sub build-color($/, $base is copy) {
        unless $/<usage> {
            my @args = @($/.ast<func><args>);
            $base ~= 'a' if @args.grep({!.<op>}) == 4;
            $base => @args;
        }
    }
    method color:sym<rgb>($/)  { make $/<rgb>.&build-color('rgb'); }
    method color:sym<rgba>($/) { make $/<rgba>.&build-color('rgb'); }
    method color:sym<hsl>($/)  { make $/<hsl>.&build-color('hsl'); }
    method color:sym<hsla>($/) { make $/<hsla>.&build-color('hsl'); }
}
