import App from 'resource:///com/github/Aylur/ags/app.js';

const v = {
    ags: `v${pkg.version}`,
    expected: `v1.6.4`,
};

function mismatch() {
    print(`Config expects ${v.expected}, but ags is ${v.ags}`);
    App.connect('config-parsed', app => app.Quit());
    return {};
}

export default v.ags === v.expected
    ? (await import('./js/main.js')).default
    : mismatch();
