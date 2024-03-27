class CavaService extends Service {
    static {
        Service.register(this,
            { 'output-changed': ['string'], },
            { 'output': ['string'],},
        );
    }

    #output = ""
    #proc = ""

    constructor() {
        super()
        this.#proc = Utils.subprocess(
            ['bash', '-c', '~/.dotfiles/non-nix/ags/scripts/cava.sh'],
            (output) => this.#onChange(output),
            (err) => logError(err),
        )
    }

    get output() { return this.#output }
    #onChange(output) {
        if (output === this.#output) {
            return;
        }

        this.#output = output
        this.emit('changed');
        this.notify('output');
        this.emit('output-changed', this.#output);
    }

}

const service = new CavaService;
export default service;
