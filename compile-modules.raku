use CSS::Specification::Compiler::Make;

sub MAIN(Str $working-directory = '.' ) {
    my %props;
    for (
         :Snapshot2026[:link,
                       <src/css-snapshot-2026/css-cascade-5.tsv
                         src/css-snapshot-2026/css-namespaces-3.tsv>,
                       :Align<src/css-snapshot-2026/css-align-3.tsv>,
                       :Animations<src/css-snapshot-2026/css-animations-1.tsv>,
                       :Backgrounds<src/css-snapshot-2026/css-backgrounds-3.tsv>,
                       :Box<src/css-snapshot-2026/css-box-4.tsv>,
                       :Break<src/css-snapshot-2026/css-break-1.tsv>,
                       :Compositing<src/css-snapshot-2026/css-compositing-1.tsv>,
                       :Color<
                           src/css-snapshot-2026/css-color-4.tsv
                           src/css-snapshot-2026/css-color-adjust-1.tsv
                        >,
                       :Contain<src/css-snapshot-2026/css-contain-2.tsv>,
                       :Display<src/css-snapshot-2026/css-display-3.tsv>,
                       :FlexBox<src/css-snapshot-2026/css-flexbox-1.tsv>,
                       :Fonts<src/css-snapshot-2026/css-fonts-4.tsv>,
                       <Fonts Defs> => <src/css-snapshot-2026/css-fonts-4/defs.tsv>,
                       :FilterEffects<src/css-snapshot-2026/css-filter-effects-1.tsv>,
                       :Grid<src/css-snapshot-2026/css-grid-1.tsv>,
                       :Images<src/css-snapshot-2026/css-images-3.tsv>,
                       :Inline<src/css-snapshot-2026/css-inline-3.tsv>,
                       :Lists<
                          src/css-snapshot-2026/css-lists-3.tsv
                          src/css-snapshot-2026/css-counter-styles-3.tsv
                        >,
                       :Logical<src/css-snapshot-2026/css-logical-1.tsv>,
                       :Masking<src/css-snapshot-2026/css-masking-1.tsv>,
                       :MediaQueries<src/css-snapshot-2026/css-mediaqueries-4.tsv>,
                       :Motion<src/css-snapshot-2026/css-motion-1.tsv>,
                       :MultiCol<src/css-snapshot-2026/css-multicol-1.tsv>,
                       :PagedMedia<src/css3x-paged-media.tsv>,
                       :Scrolling<
                           src/css-snapshot-2026/css-scroll-anchoring-1.tsv
                           src/css-snapshot-2026/css-scrollbars-1.tsv
                           src/css-snapshot-2026/css-scroll-snap-1.tsv
                        >,
                       :Shapes<src/css-snapshot-2026/css-shapes-1.tsv>,
                       :Speech<src/css-snapshot-2026/css-speech-1.tsv>,
                       :SVG<src/css-snapshot-2026/svg2-propidx.tsv>,
                       :Text<src/css-snapshot-2026/css-text-3.tsv>,
                       :TextDecor<src/css-snapshot-2026/css-text-decor-3.tsv>,
                       :Transitions<
                           src/css-snapshot-2026/css-transitions-1.tsv
                           src/css-snapshot-2026/css-view-transitions-1.tsv
                        >,
                       :Transforms<
                           src/css-snapshot-2026/css-transforms-1.tsv
                           src/css-snapshot-2026/css-transforms-2.tsv
                        >,
                       :UI<src/css-snapshot-2026/css-ui-3.tsv>,
                       :Values<
                            src/css-snapshot-2026/css-values-4.tsv
                            src/css-snapshot-2026/css-values-5.tsv
                        >,
                       :WritingModes<src/css-snapshot-2026/css-writing-modes-4.tsv>,
                       :WillChange<src/css-snapshot-2026/css-will-change-1.tsv>,
                       :CSS21<src/css21-properties.tsv>,
                      ],
         'Snapshot2026::Animations::AtKeyFrames' => [:inherit,
             <src/css-snapshot-2026/css-animations-1/@keyframes.tsv>
          ],
         'Snapshot2026::Fonts::AtFontFace' => [
             <src/css-snapshot-2026/css-fonts-4/@fontface.tsv>
          ],
         'Snapshot2026::Fonts::AtFontFeatureValues' => [
             <src/css-snapshot-2026/css-fonts-4/@font-feature-values.tsv>
          ],
         'Snapshot2026::Fonts::AtFontPaletteValues' => [
             <src/css-snapshot-2026/css-fonts-4/@font-palette-values.tsv>
          ],
         'Snapshot2026::Color::AtColorProfile' => [
             <src/css-snapshot-2026/css-color-5/@color-profile.tsv>
          ],
         'Snapshot2026::Lists::AtCounterStyle' => [
             <src/css-snapshot-2026/css-counter-styles-3/@counter-style.tsv>
          ],
         'Snapshot2026::PagedMedia::AtMedia' => [
             <src/css-snapshot-2026/css-conditional-3/@media.tsv>
          ],
          'Snapshot2026::PagedMedia::AtPage' => [
             <src/css-snapshot-2026/css-page-3/@page.tsv
             src/css-snapshot-2026/css2/margins.tsv>,
          ],
        ) -> Pair:D $_ {
        my $root = 'CSS::' ~ .key;
        my @sources = .value.List;
        my Bool ($inherit, $link);
        while @sources.head ~~ Pair:D {
            given @sources.head.key {
                when 'inherit' { $inherit = @sources.shift.value }
                when 'link'    { $link    = @sources.shift.value }
                default { last }
            }
        }
        my %inherit = %props if $inherit;
        %props = CSS::Specification::Compiler::Make.make-module($working-directory, $root, @sources, :$link, :%inherit);
    }
}

