{pkgs, ...}:
{
    home.packages = with pkgs; [
        (tlaplus18.overrideAttrs (self: super: {
            installPhase = ''
    mkdir -p $out/share/java $out/bin
    cp $src $out/share/java/tla2tools.jar

    makeWrapper ${jre}/bin/java $out/bin/tlc --add-flags "\$JAVA_OPTS" \
    --add-flags "-XX:+UseParallelGC -cp $out/share/java/tla2tools.jar tlc2.TLC"
    makeWrapper ${jre}/bin/java $out/bin/tlasany --add-flags "\$JAVA_OPTS" \
    --add-flags "-XX:+UseParallelGC -cp $out/share/java/tla2tools.jar tla2sany.SANY"
    makeWrapper ${jre}/bin/java $out/bin/pcal --add-flags "\$JAVA_OPTS" \
    --add-flags "-XX:+UseParallelGC -cp $out/share/java/tla2tools.jar pcal.trans"
    makeWrapper ${jre}/bin/java $out/bin/tlatex --add-flags "\$JAVA_OPTS" \
    --add-flags "-XX:+UseParallelGC -cp $out/share/java/tla2tools.jar tla2tex.TLA"
    makeWrapper ${jre}/bin/java $out/bin/tlarepl --add-flags "\$JAVA_OPTS" \
    --add-flags "-XX:+UseParallelGC -cp $out/share/java/tla2tools.jar tlc2.REPL"
            '';
        }))
        tlaplusToolbox
    ];
}
