{
    home.sessionVariables = {
        BROWSER = "qutebrowser";
    };

    programs.qutebrowser = {
        enable = true;
        loadAutoconfig = true;
        settings = {
            scrolling.smooth = true;
            qt.highdpi = true;
            zoom.default = 125;
            auto_save.session = true;
            colors.webpage.darkmode.enabled = false;
        };
        searchEngines = {
            g = "https://www.google.com/search?hl=en&amp;q={}";
            y = "https://yandex.ru/search/?text={}";
            t = "https://www.tarantool.io/en/doc/latest/search/?q={}";
            n = "https://mynixos.com/search?q={}";
        };
        quickmarks = {
            # Work
            gh = "https://github.com";
            ghr = "https://github.com/Serpentian?tab=repositories";
            ghi = "https://github.com/issues";
            ghp = "https://github.com/pulls";
            ghn = "https://github.com/notifications";

            ght = "https://github.com/tarantool";
            ghtt = "https://github.com/tarantool/tarantool";
            ghtv = "https://github.com/tarantool/vshard";
            ghtve = "https://github.com/tarantool/vshard-ee";

            wt = "https://www.tarantool.io/en";
            wm = "https://myteam.mail.ru/webim";

            # University
            up = "https://student.bmstu.ru/hpronto";
            ul = "https://lks.bmstu.ru";
            ud = "https://delo.bmstu.ru";

            # General
            em = "https://e.mail.ru/inbox";
            yt = "https://www.youtube.com";

            # Local
            nd = "http://192.168.1.218:4533";
            qb = "http://192.168.1.218:8080";
            sl = "http://192.168.1.218:5030";
        };
        extraConfig = ''
            c.tabs.padding = { "bottom": 8, "left": 5, "right": 5, "top": 8 }
        '';
    };
}
